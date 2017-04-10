#
# OAI
#

resource "aws_cloudfront_origin_access_identity" "asset_origin_access_identity" {
  comment = "${var.oai_comment}"
}


#
#  CloudFront
#
resource "aws_cloudfront_distribution" "asset_cloudfront_distribution" {

  enabled                 = true
  retain_on_delete        = true
  is_ipv6_enabled         = "${var.is_ipv6_enabled}"
  comment                 = "${var.comment}"
  price_class             = "${var.price_class}"
  aliases                 = ["${var.aliases}"]
  default_root_object     = "${var.default_root_object}"
  web_acl_id              = "${var.web_acl_id}"


  origin {
    domain_name       = "${var.s3_bucket_domain_name}"
    origin_id         = "${var.s3_bucket_origin_id}"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.asset_origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["${var.allowed_methods}"]
    cached_methods   = ["${var.cached_methods}"]
    target_origin_id = "${var.s3_bucket_origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
      headers = ["${var.headers}"]
    }

    viewer_protocol_policy  = "${var.viewer_protocol_policy}"
    min_ttl                 = "${var.min_ttl}"
    default_ttl             = "${var.default_ttl}"
    max_ttl                 = "${var.max_ttl}"
    compress                = "${var.compress}"
  }



  viewer_certificate {
    cloudfront_default_certificate = "${var.cloudfront_default_certificate}"
    iam_certificate_id        = "${var.iam_certificate_id}"
    acm_certificate_arn       = "${var.acm_certificate_arn}"
    minimum_protocol_version  = "${var.minimum_protocol_version}"
    ssl_support_method        = "${var.ssl_support_method}"
  }

  logging_config {
    include_cookies = "${var.include_cookies}"
    bucket          = "${var.s3_bucket_log_name}"
    prefix          = "${var.log_prefix}"
  }

  custom_error_response {
    error_code = 400
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 403
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 404
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 405
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 414
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 416
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 500
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 501
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 502
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 503
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  custom_error_response {
    error_code = 504
    error_caching_min_ttl = "${var.error_caching_min_ttl}"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
