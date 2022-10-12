variable "domain_name" {
  type        = string
  description = "Name of the domain of CND"
  default     = ""

}
variable "origin_id" {
  type        = string
  description = "origin_id of CND"
  default     = "suraj_id"

}
variable "enabled" {
  type        = bool
  description = " Whether the distribution is enabled to accept end user requests for content."
  default     = true

}
variable "default_cache_behaviors" {
  type        = list(any)
  description = "The default cache behavior for this distribution (maximum one)."
  default     = []

}

variable "forwarded_valuess" {
  type        = list(any)
  description = "The forwarded values configuration that specifies how CloudFront handles query strings, cookies and headers (maximum one)."
  default     = []
}
variable "cookiess" {
  type        = list(any)
  description = "The forwarded values cookies that specifies how CloudFront handles cookies (maximum one)."

}
variable "lambda_function_associations" {
  type        = list(any)
  description = "Lambda@Edge allows you to associate an AWS Lambda Function with a predefined event."
  default     = []


}
variable "viewer_certificates" {
  type        = list(any)
  description = "The SSL configuration for this distribution (maximum one)"
  default     = []

}
variable "restriction_type" {
  type        = string
  description = ""
  default     = "The restriction configuration for this distribution (maximum one)"

}
variable "tags" {
  type        = map(any)
  description = "A map of tags to assign to the resource"
  default = {

  }
}
variable "origin_access_identity" {
  type        = string
  description = "The CloudFront S3 origin configuration information"

}

