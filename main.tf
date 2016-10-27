#
# OAI
#

resource "aws_cloudfront_origin_access_identity" "asset_origin_access_identity" {
  comment = "asset_origin_access_identity"
}


#
#  CloudFront
#
resource "aws_cloudfront_distribution" "asset_cloudfront_distribution" {

  enabled                 = true
  retain_on_delete        = true
  comment                 = "asset_cloudfront_distribution"
  price_class             = "${var.price_class}"
  aliases                 = ["${var.aliases}"]
  default_root_object     = "${var.default_root_object}"


  origin {
    domain_name       = "${var.s3_bucket_asset_id}.s3.amazonaws.com"
    origin_id         = "S3-${var.s3_bucket_asset_id}"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.asset_origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD" , "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.s3_bucket_asset_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy  = "${var.viewer_protocol_policy}"
    min_ttl                 = "${var.min_ttl}"
    default_ttl             = "${var.default_ttl}"
    max_ttl                 = "${var.max_ttl}"
  }



  viewer_certificate {
    cloudfront_default_certificate = "${var.cloudfront_default_certificate}"
    iam_certificate_id        = "${var.iam_certificate_id}"
    acm_certificate_arn       = "${var.acm_certificate_arn}"
    minimum_protocol_version  = "${var.minimum_protocol_version}"
    ssl_support_method        = "${var.ssl_support_method}"
  }

  logging_config {
    include_cookies = false
    bucket          = "${var.s3_bucket_log_id}.s3.amazonaws.com"
    prefix          = "cloudfront/"
  }

  custom_error_response {
    error_code = 400
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 403
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 404
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 405
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 414
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 416
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 500
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 501
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 502
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 503
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  custom_error_response {
    error_code = 504
    error_caching_min_ttl = ${var.error_caching_min_ttl}
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
