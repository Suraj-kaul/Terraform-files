output "CDN_id" {
  description = "OAI ID"
  value       = aws_cloudfront_origin_access_identity.example.iam_arn

}

output "OAI" {
  description = "Origin-access-id"
  value       = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path

}