# frozen_string_literal: true

require "capturekit"

client = CaptureKit::Client.new # reads CAPTUREKIT_API_KEY
submitted = client.content(url: "https://example.com", is_async: true)
job = client.wait_for_job(submitted.data["job_id"]) { |j| puts "#{j['status']} #{j['progress']}%" }
puts job.data
