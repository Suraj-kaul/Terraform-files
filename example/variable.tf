variable "CDNN" {
  type        = map(any)
  description = "mutiple values"
}
variable "enabled" {
  type        = bool
  description = ""

}
variable "region" {
  type = string
  description = "region should be specified"
  
}
variable "restriction_type" {
  type        = string
  description = ""

}
variable "origin_id" {
  type        = string
  description = ""
}
variable "common_tags" {
  type        = map(any)
  description = "value"

}

variable "buckets" {
  type        = map(any)
  description = ""

}