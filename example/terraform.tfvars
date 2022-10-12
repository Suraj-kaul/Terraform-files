CDNN = {
  "0" = {
    "default_cache_behaviors" = [{
      "allowed_methods"        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      "cached_methods"         = ["GET", "HEAD"]
      "target_origin_id"       = "suraj_id"
      "default_ttl"            = 3600
      "max_ttl"                = 86400
      "min_ttl"                = 0
      "viewer_protocol_policy" = "allow-all"
    }]
    "forwarded_valuess" = [{
      "query_string" = false
    }]
    "cookiess" = [{
      "forward" = "none"

    }]
    "viewer_certificates" = [{
      "cloudfront_default_certificate" = true
    }]
  }
}
origin_id        = "suraj_id"
region           = "us-east-1"
restriction_type = "none"
enabled          = true
buckets = {
  "0" = {
    "bucket_name"       = "surajtesting123467"
    "acl"               = "private"
    "versioning_enable" = true
  }
}

common_tags = {
  "CDN" = "suraj_testing"
}