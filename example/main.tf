data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [module.C_D_N["0"].CDN_id]
    }

    actions = [
      "s3:GetObject"


    ]

    resources = [
      "arn:aws:s3:::${module.S3["0"].s3_bucket_id}/*"
    ]
  }
}

module "C_D_N" {
  source                  = "../CDN"
  for_each                = var.CDNN
  default_cache_behaviors = each.value.default_cache_behaviors
  forwarded_valuess       = each.value.forwarded_valuess
  cookiess                = each.value.cookiess
  origin_access_identity  = module.C_D_N["0"].OAI
  viewer_certificates     = each.value.viewer_certificates
  enabled                 = var.enabled
  restriction_type        = var.restriction_type
  domain_name             = module.S3["0"].s3_domian
  origin_id               = var.origin_id
  tags                    = merge(var.common_tags)

}

module "S3" {
  source            = "../S3"
  for_each          = var.buckets
  bucket_name       = each.value.bucket_name
  acl               = each.value.acl
  versioning_enable = each.value.versioning_enable
  buck_name         = module.S3["0"].s3_bucket_id
  bukcet_policy     = data.aws_iam_policy_document.bucket_policy.json
  tags              = merge(var.common_tags)

}
