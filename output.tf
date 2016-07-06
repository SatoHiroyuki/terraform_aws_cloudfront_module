output "oai_id" {
    value = "aws_cloudfront_origin_access_identity.asset_origin_access_identity.id"
}

output "cloudfront_distribution_id" {
    value = "aws_cloudfront_distribution.asset_cloudfront_distribution.id"
}
