variable "bucket_name" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = "my-bucket-suraj123456"
}


variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'. Conflicts with `grant`"
  type        = string
  default     = "private"
}
variable "versioning_enable" {
  type    = bool
  default = false
}

variable "buck_name" {
  type        = string
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name"

}
variable "bukcet_policy" {
  type        = string
  description = "bucket policy"

}
variable "tags" {
  type        = map(any)
  description = ""
  default = {

  }

}