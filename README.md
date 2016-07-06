# terraform_aws_cloudfront_module
A Terraform module to provide an CloudFront in AWS.

## Usage

```js
module "terraform_aws_cloudfront_module" {
  source = "git::https://github.com/SatoHiroyuki/terraform_aws_cloudfront_module.git"

  aliases = "www.test.com"
  s3_bucket_asset_id = "asset_bucket"
  s3_bucket_log_id = "log_bucket"
}
```

## Outputs

 - `oai_id` - cloudfront_origin_access_identity_id
 - `cf_id` - cloudfront_distribution_id

