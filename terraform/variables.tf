variable "environment" {
  description = "Environment being built. DEV, QA or PRD"
  type        = string
}

variable "aws_region" {
  description = "AWS Region to execute deployment to"
  type        = string
}

variable "app_name" {
  description = "App name. Used mainly for tagging"
  type        = string
}

variable "image_builder_map" {
  description = "Map of image builders to be created"
  type        = any
}

variable "kms_key_arn" {
  description = "KMS Key to be used"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to create resources in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to create resources in"
  type        = string
}