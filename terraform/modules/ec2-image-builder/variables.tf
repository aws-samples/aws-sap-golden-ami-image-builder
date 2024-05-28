variable "environment" {
  description = "Environment being built. DEV, QA or PRD"
  type        = string
}

variable "aws_region" {
  description = "(Required) AWS Region to execute deployment to"
  type        = string
}

variable "app_name" {
  description = "Version to be used on EKS cluster"
  type        = string
}

variable "kms_key_arn" {
  description = "Key ARN on KMS to use"
  type        = string
}

variable "s3_bucket_ec2_image_builder_logs" {
  description = "S3 buckets to allow access into"
  type        = string
}

variable "base_ami" {
  description = "Base AMI to be used"
  type        = string
}

variable "operating_system" {
  description = "Operating system name for creating components"
  type        = string

  validation {
    condition     = contains(["OEL", "RHEL", "SUSE"], var.operating_system)
    error_message = "The operating_system must be either OEL, RHEL or SUSE"
  }
}

variable "final_usage_of_ami" {
  description = "The final usage for the created AMI. Examples: SAP or Oracle"
  type        = string
}

variable "instance_profile_name" {
  description = "Role to be used for building the image"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to place the builder instance in"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to place the builder instance in"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "versions" {
  description = "Versions of the AMI to create"
  type        = map(string)
}

variable "version_to_publish" {
  description = "The version index to publish from the list above"
  type        = string
}

variable "suse_sp_version" {
  description = "SUSE Version with Service Package to enable repositoryes. Example: 15.5 means version 15 Service Package 5"
  type = string
}