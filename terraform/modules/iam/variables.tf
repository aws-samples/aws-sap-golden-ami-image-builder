variable "environment" {
  description = "Environment being built. DEV, QA or PRD"
  type        = string
}

variable "aws_region" {
  description = "(Required) AWS Region to execute deployment to"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "s3_bucket_ec2_image_builder_logs" {
  description = "S3 buckets to allow access into"
  type        = string
}

variable "kms_keys_to_authorize" {
  description = "KMS keys ARNs to authorize the roles to handle"
  type        = list(string)
}