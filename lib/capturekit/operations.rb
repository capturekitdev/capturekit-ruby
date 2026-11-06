# frozen_string_literal: true

# Generated from the CaptureKit OpenAPI document. Do not edit by hand.

module CaptureKit
  # One method per documented endpoint. Mixed into {Client}.
  module Operations
    # Analyze (AI). AI Content API analyzes any webpage and returns AI insights summary, value proposition, features, categories, use cases, and optional contact signals. Credit cost: 1 credit per call.
    #
    # +GET / POST /v1/analyze+
    #
    # @param url [String] (required) The URL of the webpage to capture.
    # @param custom_response [String] Pass custom response fields to be included in the AI response.
    # @param custom_prompt [String] Add your own instructions to guide the AI’s analysis.
    # @param proxy [String] Specify a proxy server to route your request through.
    # @param cache [Boolean] Cache the response.
    # @param cache_ttl [Numeric] Cache the response for a custom TTL (in seconds).
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def analyze(request_options: nil, **params)
      call_operation("analyze", params, request_options)
    end

    # Capture (Screenshot). Browser-like Screenshot API that captures webpages as PNG/JPEG/WebP or PDF for previews, QA, reporting, monitoring, and archiving no headless setup. Credit cost: 1 credit per call.
    #
    # +GET / POST /v1/capture+
    #
    # @param url [String] (required) The URL of the webpage to capture. Examples:  https://www.amazon.com/s?k=pokemon
    # @param format [String] The output format of the screenshot.
    # @param device [String] The device type to emulate for the screenshot.
    # @param full_page [Boolean] Capture the entire page instead of just the visible viewport.
    # @param full_page_scroll [Boolean] Scroll the page to fully load lazy-loaded elements before capturing a full-page screenshot.
    # @param full_page_scroll_duration [Numeric] Time in milliseconds for scrolling before capturing the full page.
    # @param viewport_width [Numeric] The width of the browser viewport in pixels.
    # @param viewport_height [Numeric] The height of the browser viewport in pixels.
    # @param scale_factor [Numeric] The scale factor for high-resolution screenshots.
    # @param image_quality [String] Generate images with custom quality settings.
    # @param selector [String] Capture a specific element on the page instead of the full viewport.
    # @param cache [Boolean] Cache the response.
    # @param cache_ttl [Numeric] Cache the response for a custom TTL (in seconds).
    # @param remove_selectors [String] A comma-separated list of elements to hide before capturing (e.g., ads, popups).
    # @param remove_cookie_banners [Boolean] Automatically remove cookie banners before capturing.
    # @param remove_ads [Boolean] Automatically remove ads before capturing.
    # @param block_resources [String] Comma-separated list of resource types to block (e.g., “image,stylesheet,font”).
    # @param block_urls [String] Comma-separated list of URL patterns to block (e.g., “analytics,tracking,advertisement”).
    # @param delay [Numeric] Delay in seconds before capturing the screenshot.
    # @param wait_until [Array<String>] Define when to capture.
    # @param wait_for_selector [String] Wait for a specific element to appear before taking the screenshot.
    # @param proxy [String] Specify a proxy server to route your request through.
    # @param s3_secret_key [String] AWS S3 secret access key.
    # @param s3_access_key_id [String] AWS S3 access key ID.
    # @param s3_bucket [String] The S3 bucket name where the screenshot will be uploaded.
    # @param s3_object_key [String] The filename for the S3 object (auto-generated if not provided).
    # @param s3_region [String] AWS S3 region for storage.
    # @param storage_endpoint [String] Leave this field empty for AWS S3. Only specify a value if required. S3-compatible storage services are supported, for example, use https://<accountId>.r2.cloudflarestorage.com for Cloudflare R2.
    # @param s3_url [Boolean] Use S3 storage for screenshots. The S3 URL will be returned in the response.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def capture(request_options: nil, **params)
      call_operation("capture", params, request_options)
    end

    # Content. CaptureKit Content API extracts structured webpage data, metadata, links, HTML/Markdown: in one request for SEO, monitoring, indexing and automation. Credit cost: 1 credit per call.
    #
    # +GET / POST /v1/content+
    #
    # @param url [String] (required) The URL of the webpage to capture.
    # @param include_html [Boolean] Include the raw HTML of the webpage in the response.
    # @param include_markdown [Boolean] Include the Markdown of the webpage in the response.
    # @param include_sitemap [Boolean] Include the sitemap of the website in the response.
    # @param use_defuddle [Boolean] Use Defuddle to clean and extract the main content from web pages. This popular library removes unnecessary elements like comments, sidebars, headers, footers, and other non-essential elements, leavi…
    # @param remove_selectors [String] A comma-separated list of elements to hide before capturing (e.g., ads, popups).
    # @param remove_cookie_banners [Boolean] Automatically remove cookie banners before capturing.
    # @param remove_ads [Boolean] Automatically remove ads before capturing.
    # @param block_resources [String] Comma-separated list of resource types to block (e.g., “image,stylesheet,font”).
    # @param block_urls [String] Comma-separated list of URL patterns to block (e.g., “analytics,tracking,advertisement”).
    # @param delay [Numeric] Delay in seconds before capturing the screenshot.
    # @param wait_until [Array<String>] Define when to capture.
    # @param wait_for_selector [String] Wait for a specific element to appear before taking the screenshot.
    # @param proxy [String] Specify a proxy server to route your request through.
    # @param cache [Boolean] Cache the response.
    # @param cache_ttl [Numeric] Cache the response for a custom TTL (in seconds).
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def content(request_options: nil, **params)
      call_operation("content", params, request_options)
    end

    # Jobs. Poll the status, progress (0–100) and result of a job started with is_async=true. Polling is free. Poll until status is terminal: CompletedJob, Error, NotFound or BadRequest.
    #
    # +GET /v1/jobs/{id}+
    #
    # @param id [String] (required) The job_id returned by an endpoint called with is_async=true.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def jobs(request_options: nil, **params)
      call_operation("jobs", params, request_options)
    end

    # Stats. Infrastructure health for an engine or endpoint over the last hour. Not scoped to your account or tenant. Enabled per account: HTTP 403 means contact support to activate it.
    #
    # +GET /v1/stats+
    #
    # @param engine [String] API family to check, for example capture. Provide at least engine or path.
    # @param path [String] Specific endpoint to check, for example /v1/capture. If you also pass engine, use an endpoint from that API.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def stats(request_options: nil, **params)
      call_operation("stats", params, request_options)
    end

    # Usage. Retrieve real-time usage statistics and credit balance for your CaptureKit account.
    #
    # +GET /v1/usage+
    #
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def usage(request_options: nil, **params)
      call_operation("usage", params, request_options)
    end

    # Website Crawler. Website Crawler API fetches raw HTML from any webpage in request mode (no rendering) for fast scraping, audits, monitoring, and link/metadata extraction. Credit cost: 1 credit per call.
    #
    # +GET / POST /v1/website/crawler+
    #
    # @param query [String] (required) A website URL with either the http or https protocol.
    # @param allow_redirects [Boolean] If set to false, do not follow redirects.
    # @param return_page_source [Boolean] If set to true, the response will be the HTML source of the page.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def website_crawler(request_options: nil, **params)
      call_operation("website_crawler", params, request_options)
    end
  end
end
