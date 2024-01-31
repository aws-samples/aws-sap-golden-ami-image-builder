resource "aws_imagebuilder_image_recipe" "this" {
  for_each = var.versions

  name         = "${var.environment}-${var.operating_system}-AMI-recipe"
  parent_image = var.base_ami
  version      = each.value

  block_device_mapping {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination = true
      volume_size           = 50
      volume_type           = "gp3"

      encrypted  = true
      kms_key_id = var.kms_key_arn
    }
  }

  component {
    component_arn = aws_imagebuilder_component.custom_ansible.arn
  }

  working_directory = "/home/ec2-user"

  tags = var.tags
}

resource "aws_imagebuilder_image" "this" {
  for_each = aws_imagebuilder_image_recipe.this

  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.this.arn
  image_recipe_arn                 = each.value.id
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn
}
