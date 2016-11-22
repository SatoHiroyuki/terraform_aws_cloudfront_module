
#OAI
variable "oai_comment" {default = "asset_origin_access_identity"}

# main
variable "price_class" {default = "PriceClass_All"}
variable "aliases" {default = "" }
variable "default_root_object" {default = "index.html"}
variable "comment" {default = "asset_cloudfront_distribution"}
variable "compress" {default = true}
variable "web_acl_id" {default = ""}

# origin
variable "viewer_protocol_policy" {default = "allow-all"}
variable "s3_bucket_asset_id" {default = "" }
variable "min_ttl" {default = "5"}
variable "default_ttl" {default = "5"}
variable "max_ttl" {default = "5"}

# viewer_certificate
variable "cloudfront_default_certificate" {default = ""}
variable "iam_certificate_id" {default = ""} 
variable "acm_certificate_arn" {default = ""}
variable "minimum_protocol_version" {default = "SSLv3"}
variable "ssl_support_method" {default = ""}

# log
variable "s3_bucket_log_id" {default = "" }
variable "prefix" {default = "cloudfront"}

# custom_error_response
variable "error_caching_min_ttl" {default = "0"}
