# frozen_string_literal: true

# Generated from the CaptureKit OpenAPI document. Do not edit by hand.

module CaptureKit
  # Path, methods, response kind and parameter names of every documented operation.
  ENDPOINTS = {
    "analyze" => {
      path: "/v1/analyze",
      methods: ["GET", "POST"].freeze,
      response: :json,
      required: ["url"].freeze,
      params: ["url", "custom_response", "custom_prompt", "proxy", "cache", "cache_ttl", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "capture" => {
      path: "/v1/capture",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["url"].freeze,
      params: ["url", "format", "device", "full_page", "full_page_scroll", "full_page_scroll_duration", "viewport_width", "viewport_height", "scale_factor", "image_quality", "selector", "cache", "cache_ttl", "remove_selectors", "remove_cookie_banners", "remove_ads", "block_resources", "block_urls", "delay", "wait_until", "wait_for_selector", "proxy", "s3_secret_key", "s3_access_key_id", "s3_bucket", "s3_object_key", "s3_region", "storage_endpoint", "s3_url", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "content" => {
      path: "/v1/content",
      methods: ["GET", "POST"].freeze,
      response: :json,
      required: ["url"].freeze,
      params: ["url", "include_html", "include_markdown", "include_sitemap", "use_defuddle", "remove_selectors", "remove_cookie_banners", "remove_ads", "block_resources", "block_urls", "delay", "wait_until", "wait_for_selector", "proxy", "cache", "cache_ttl", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "jobs" => {
      path: "/v1/jobs/{id}",
      methods: ["GET"].freeze,
      response: :json,
      required: ["id"].freeze,
      params: ["id"].freeze
    }.freeze,
    "stats" => {
      path: "/v1/stats",
      methods: ["GET"].freeze,
      response: :json,
      required: [].freeze,
      params: ["engine", "path"].freeze
    }.freeze,
    "usage" => {
      path: "/v1/usage",
      methods: ["GET"].freeze,
      response: :json,
      required: [].freeze,
      params: [].freeze
    }.freeze,
    "website_crawler" => {
      path: "/v1/website/crawler",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["query"].freeze,
      params: ["query", "allow_redirects", "return_page_source", "fields", "is_async", "soft_fail"].freeze
    }.freeze
  }.freeze
end
