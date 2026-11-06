# frozen_string_literal: true

require "capturekit"

client = CaptureKit::Client.new # reads CAPTUREKIT_API_KEY
begin
  response = client.request("GET", "/v1/usage")
  puts response.data if response.json?
rescue CaptureKit::APIError => e
  warn "HTTP #{e.status}: #{e.message}"
end
