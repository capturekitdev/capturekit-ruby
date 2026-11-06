# CaptureKit Ruby SDK

The official Ruby SDK for the [CaptureKit](https://www.capturekit.dev) screenshot API.

Capture websites as PNG, JPEG, WebP or PDF, extract their content, or analyse them with AI.

The SDK exposes **7 methods**, one per documented endpoint, plus a generic `request`. It only uses the Ruby standard library.

## Requirements

- Ruby 3.1 or newer

## Installation

```sh
gem install capturekitdev
```

Or in your `Gemfile`:

```ruby
gem "capturekitdev"
```

## Get your API key

[Sign up for CaptureKit](https://app.capturekit.dev/register) or sign in, then copy your API key from the [dashboard](https://app.capturekit.dev). The client reads `ENV["CAPTUREKIT_API_KEY"]` when no key is passed.

## Quick start

```ruby
require "capturekit"

client = CaptureKit::Client.new(api_key: ENV.fetch("CAPTUREKIT_API_KEY"))
response = client.content(url: "https://example.com")
puts response.data
```

Keyword arguments use the parameter names of the [API reference](https://app.capturekit.dev/openapi). Unknown names raise `CaptureKit::SerializationError`; use `request` for undocumented parameters.

## Binary responses

Endpoints that can return a file (image, PDF…) return a `JsonResponse` or a `BinaryResponse`:

```ruby
response = client.capture(url: "https://example.com", format: "png")
response.save("screenshot.png") if response.binary?
```

## Async jobs

Any call accepts `is_async: true` (useful past the 60-second server limit): the response is then a `job_id`. `wait_for_job` polls `GET /v1/jobs/{id}` until a terminal status (`CompletedJob`, `Error`, `NotFound`, `BadRequest`):

```ruby
submitted = client.content(url: "https://example.com", is_async: true)
job = client.wait_for_job(submitted.data["job_id"]) { |j| puts "#{j['status']} #{j['progress']}%" }
puts job.data
```

## GET or POST

Methods use GET when the endpoint supports it (query string). POST sends the same parameters as JSON:

```ruby
client.analyze(url: "test", request_options: { method: "POST" })
```

`nil` values are omitted, `false` and `0` are sent, and arrays repeat the parameter name.

## Any endpoint

```ruby
response = client.request("GET", "/v1/usage")
```

## Errors

```ruby
begin
  client.content(url: "https://example.com")
rescue CaptureKit::APIError => e
  warn "HTTP #{e.status}: #{e.message}"
end
```

| Error | When |
| --- | --- |
| `CaptureKit::ConfigurationError` | Missing API key, invalid options or unsupported method. |
| `CaptureKit::SerializationError` | A required parameter is missing, unknown or can't be sent. |
| `CaptureKit::TransportError` | Network failure or timeout. |
| `CaptureKit::APIError` | Non-2xx status (`status`, `error_message`, `response_body`, `raw_response`). |
| `CaptureKit::ResponseDecodingError` | A success response could not be decoded. |

All of them inherit from `CaptureKit::Error`.

## Retries

Requests are retried up to 3 times after a network error, a `408`, `500`, `502`, `503` or `504`, or a rate limit — which the API returns as `401` (or `429`) with a `Rate limit exceeded` message. Per-key quota errors (`…: quota daily`) are not retried, nor are `400`, `402`, `404` or client-side timeouts. The delay starts at 1 second and grows 1.5× per retry (capped at 30 seconds); a `Retry-After` header wins.

```ruby
client = CaptureKit::Client.new(max_retries: 5, retry_delay: 0.5)
client.content(url: "https://example.com", request_options: { max_retries: 0 }) # one request without retries
```

## Batch requests

`batch` runs the block for every item on 10 threads (`concurrency:`) and returns one `BatchResult` per item, in input order. A failing item never stops the others.

```ruby
inputs = ["https://example.com", "https://www.capturekit.dev", "https://github.com"]
results = client.batch(inputs, concurrency: 5) { |value| client.content(url: value) }
results.each do |result|
  if result.ok?
    puts result.value.data
  else
    warn "#{inputs[result.index]}: #{result.error.message}"
  end
end
```

| Constant | Default | Description |
| --- | --- | --- |
| `CaptureKit::Client::DEFAULT_CONCURRENCY` | `10` | Tasks run at the same time by batch |
| `CaptureKit::Client::DEFAULT_TIMEOUT` | `120` | Request timeout (seconds) |
| `CaptureKit::Client::MAX_RETRIES` | `3` | Retry attempts after a network error, a 408/5xx or a rate limit |
| `CaptureKit::Client::RETRY_BACKOFF_FACTOR` | `1.5` | Exponential backoff multiplier |
| `CaptureKit::Client::DEFAULT_RETRY_DELAY` | `1.0` | Delay before the first retry (seconds) |

## Timeouts and custom transports

```ruby
client = CaptureKit::Client.new(timeout: 60) # seconds, default 120
client.content(url: "https://example.com", request_options: { timeout: 30 })
```

A transport is any object with `call(method:, url:, headers:, body:, timeout:)` returning `[status, headers, body]`; the default is `CaptureKit::NetHTTPTransport`.

## Endpoints

7 methods, generated from the [OpenAPI document](https://app.capturekit.dev/openapi).

| Method | HTTP | Description |
| --- | --- | --- |
| `analyze` | GET / POST `/v1/analyze` | AI Content API analyzes any webpage and returns AI insights summary, value proposition, features, categories, use cases, and optional conta… |
| `capture` | GET / POST `/v1/capture` | Browser-like Screenshot API that captures webpages as PNG/JPEG/WebP or PDF for previews, QA, reporting, monitoring, and archiving no headle… |
| `content` | GET / POST `/v1/content` | CaptureKit Content API extracts structured webpage data, metadata, links, HTML/Markdown: in one request for SEO, monitoring, indexing and a… |
| `jobs` | GET `/v1/jobs/{id}` | Poll the status, progress (0–100) and result of a job started with is_async=true. Polling is free. Poll until status is terminal: Completed… |
| `stats` | GET `/v1/stats` | Infrastructure health for an engine or endpoint over the last hour. Not scoped to your account or tenant. Enabled per account: HTTP 403 mea… |
| `usage` | GET `/v1/usage` | Retrieve real-time usage statistics and credit balance for your CaptureKit account. |
| `website_crawler` | GET / POST `/v1/website/crawler` | Website Crawler API fetches raw HTML from any webpage in request mode (no rendering) for fast scraping, audits, monitoring, and link/metada… |

## License

MIT — see [LICENSE](LICENSE).
