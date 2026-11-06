# frozen_string_literal: true

require "json"
require "capturekit"

client = CaptureKit::Client.new # reads CAPTUREKIT_API_KEY
response = client.content(url: "https://example.com")
puts JSON.pretty_generate(response.data)
