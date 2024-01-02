variable "aws_region" {
  description = "(Required) AWS Region to execute deployment to"
  type        = string
}

variable "environment" {
  description = "Environment being built. DEV, QA or PRD"
  type        = string
}

variable "kms_key_arn" {
  description = "CMK ARN to be used for bucket encryption"
  type        = string
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256, aws:kms, and none"
  type        = string
  default     = "aws:kms"
}

variable "bucket_name" {
  description = "Name to use for the bucket"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
