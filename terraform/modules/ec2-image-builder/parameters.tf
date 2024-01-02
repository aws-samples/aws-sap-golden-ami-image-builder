module "parameters" {
  source = "../../modules/ssm_parameters"

  aws_region  = var.aws_region
  environment = var.environment

  params_to_create = {
    "amis/golden/${lower(var.operating_system)}/${lower(var.final_usage_of_ami)}" = {
      "value" = tolist(aws_imagebuilder_image.this[var.version_to_publish].output_resources[0].amis)[0].image
      "type"  = "String"
    }
  }
}
