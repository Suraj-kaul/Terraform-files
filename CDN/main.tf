resource "aws_cloudfront_origin_access_identity" "example" {
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled         = var.enabled
  is_ipv6_enabled = true 
  origin {
    domain_name = var.domain_name
    origin_id   = var.origin_id
    s3_origin_config {
      origin_access_identity = var.origin_access_identity
    }
  }
  dynamic "default_cache_behavior" {
    for_each = var.default_cache_behaviors
    content {
      viewer_protocol_policy = lookup(default_cache_behavior.value, "viewer_protocol_policy", "allow_all")
      allowed_methods        = lookup(default_cache_behavior.value, "allowed_methods", ["GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"])
      cached_methods         = lookup(default_cache_behavior.value, "cached_methods", ["GET", "HEAD"])
      target_origin_id       = lookup(default_cache_behavior.value, "target_origin_id", "suraj_id")
      default_ttl            = lookup(default_cache_behavior.value, "default_ttl", null)
      max_ttl                = lookup(default_cache_behavior.value, "max_ttl", null)
      min_ttl                = lookup(default_cache_behavior.value, "min_ttl", null)


      dynamic "forwarded_values" {
        for_each = var.forwarded_valuess
        content {
          query_string = lookup(forwarded_values.value, "query_string", null)
          dynamic "cookies" {
            for_each = var.cookiess
            content {
              forward = lookup(cookies.value, "forward", null)

            }
          }
        }
      }

      dynamic "lambda_function_association" {
        for_each = var.lambda_function_associations
        content {
          event_type   = lookup(lambda_function_association.value, "event_type", null)
          lambda_arn   = lookup(lambda_function_association.value, "lambda_arn", null)
          include_body = lookup(lambda_function_association.value, "include_body", null)
        }
      }
    }


  }
  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type //"none"

    }
  }

  dynamic "viewer_certificate" {
    for_each = var.viewer_certificates
    content {
      cloudfront_default_certificate = lookup(viewer_certificate.value, "cloudfront_default_certificate", null)

    }
  }
  tags = var.tags

}
