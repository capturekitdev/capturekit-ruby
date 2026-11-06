# frozen_string_literal: true

require_relative "lib/capturekit/version"

Gem::Specification.new do |spec|
  spec.name = "capturekitdev"
  spec.version = CaptureKit::VERSION
  spec.authors = ["CaptureKit"]
  spec.email = ["contact@capturekit.dev"]

  spec.summary = "Official Ruby SDK for the CaptureKit screenshot API."
  spec.description = "Capture websites as PNG, JPEG, WebP or PDF, extract their content, or analyse them with AI."
  spec.homepage = "https://www.capturekit.dev"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/capturekitdev/capturekit-ruby/issues",
    "documentation_uri" => "https://app.capturekit.dev/openapi",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/capturekitdev/capturekit-ruby"
  }

  spec.files = Dir["LICENSE", "README.md", "examples/**/*", "lib/**/*.rb", "sig/**/*.rbs"]
  spec.require_paths = ["lib"]
end
