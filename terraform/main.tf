resource "random_string" "random" {
  length           = 5
  special          = false
  lower = true
  upper = false
}

module "s3_bucket_ec2_image_builder" {
  source = "./modules/s3"

  aws_region  = var.aws_region
  environment = var.environment

  kms_key_arn = var.kms_key_arn
  bucket_name = "ec2-image-builder-${random_string.random.result}"

  tags = local.tags
}

module "sap_iam_roles" {
  source = "./modules/iam"

  aws_region  = var.aws_region
  environment = var.environment

  s3_bucket_ec2_image_builder_logs = module.s3_bucket_ec2_image_builder.bucket_name

  kms_keys_to_authorize = [
    var.kms_key_arn
  ]

  tags = local.tags
}
