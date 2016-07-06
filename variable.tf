# main
variable "price_class" {default = "PriceClass_All"}
variable "aliases" {default = "" }
variable "default_root_object" {default = "index.html"}

# origin
variable "viewer_protocol_policy" {default = "allow-all"}
variable "s3_bucket_asset_id" {default = "" }
variable "min_ttl" {default = "10"}
variable "default_ttl" {default = "10"}
variable "max_ttl" {default = "10"}

# viewer_certificate
variable "cloudfront_default_certificate" {default = ""}
variable "iam_certificate_id" {default = ""} 
variable "acm_certificate_arn" {default = ""}
variable "minimum_protocol_version" {default = "SSLv3"}
variable "ssl_support_method" {default = ""}

# log
variable "s3_bucket_log_id" {default = "" }

# custom_error_response
variable "error_caching_min_ttl" {default = "0"}
