resource "aws_imagebuilder_distribution_configuration" "this" {
  name        = "${var.environment}-${var.operating_system}-local-distribution"
  description = "Distribution config for when an AMI is built"

  distribution {
    ami_distribution_configuration {

      ami_tags = merge({
        "Name"                            = "Golden-AMI-${var.operating_system}",
        "Created-By"                      = "EC2-Image-Builder",
        "EC2-Image-Builder-Pipeline-Name" = "${var.app_name}-AMI-pipeline",
        },
      var.tags)

      kms_key_id = var.kms_key_arn

      name = "Golden-AMI-${var.operating_system}-{{ imagebuilder:buildDate }}"
    }
    region = var.aws_region
  }

  tags = merge(var.tags)
}
