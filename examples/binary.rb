# frozen_string_literal: true

require "capturekit"

client = CaptureKit::Client.new # reads CAPTUREKIT_API_KEY
response = client.capture(url: "https://example.com", format: "png")
if response.binary?
  response.save("screenshot.png")
  puts "Saved screenshot.png (#{response.content_type}, #{response.bytes.bytesize} bytes)"
else
  puts response.data
end
