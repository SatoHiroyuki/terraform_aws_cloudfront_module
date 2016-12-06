output "cloudfront_oai_id" {
    value = "${aws_cloudfront_origin_access_identity.asset_origin_access_identity.id}"
}

output "cloudfront_oai_iam_arn" {
    value = "${aws_cloudfront_origin_access_identity.asset_origin_access_identity.iam_arn}"
}

output "cloudfront_distribution_id" {
    value = "${aws_cloudfront_distribution.asset_cloudfront_distribution.id}"
}

output "cloudfront_domain_name" {
    value = "${aws_cloudfront_distribution.asset_cloudfront_distribution.domain_name}"
}

output "cloudfront_hosted_zone_id" {
    value = "${aws_cloudfront_distribution.asset_cloudfront_distribution.hosted_zone_id}"
}
