resource "aws_imagebuilder_image_pipeline" "this" {
  name                             = "${var.environment}-${var.operating_system}-AMI-pipeline"
  status                           = "ENABLED"
  description                      = "Creates the golden AMI for ${var.operating_system}"
  image_recipe_arn                 = aws_imagebuilder_image_recipe.this[var.version_to_publish].arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.this.arn

  # Test the image after build
  image_tests_configuration {
    image_tests_enabled = true
    timeout_minutes     = 60
  }

  tags = {
    "Name" = "${var.app_name}-AMI-pipeline"
  }
}
