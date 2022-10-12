resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
  versioning {
    enabled = var.versioning_enable

  }
  tags = var.tags
}

resource "aws_s3_bucket_policy" "this" {

  bucket = var.buck_name
  policy = var.bukcet_policy
}


