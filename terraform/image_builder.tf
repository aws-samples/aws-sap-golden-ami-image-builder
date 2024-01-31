module "ec2_image_builder" {
  for_each = var.image_builder_map
  source   = "./modules/ec2-image-builder"

  aws_region  = var.aws_region
  environment = var.environment
  app_name    = "${each.value["app_name"]}-${var.app_name}"
  kms_key_arn = var.kms_key_arn

  operating_system   = each.value["operating_system"]
  final_usage_of_ami = each.value["final_usage_of_ami"]
  versions           = each.value["versions"]
  version_to_publish = each.value["version_to_publish"]

  base_ami                         = each.value["base_ami"]
  s3_bucket_ec2_image_builder_logs = module.s3_bucket_ec2_image_builder.bucket_name
  instance_profile_name            = module.sap_iam_roles.iam_instance_profile_name

  subnet_id = var.subnet_id
  vpc_id    = var.vpc_id

  tags = local.tags

  depends_on = [module.sap_iam_roles]
}
