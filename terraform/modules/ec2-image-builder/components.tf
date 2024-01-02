resource "aws_s3_object" "this" {
  bucket = var.s3_bucket_ec2_image_builder_logs

  key         = "/ec2-image-builder/components/${var.operating_system}/files/call_ansible_from_git.yaml"
  source      = "${path.module}/files/call_ansible_from_git.yaml"
  source_hash = filemd5("${path.module}/files/call_ansible_from_git.yaml")
}

resource "aws_imagebuilder_component" "custom_ansible" {
  name                  = "${var.environment}-${var.operating_system}-RunAnsibleForGoldenAMI"
  platform              = "Linux"
  supported_os_versions = ["Red Hat Enterprise Linux 7", "Oracle Enterprise Linux 8"]
  uri                   = "s3://${var.s3_bucket_ec2_image_builder_logs}/ec2-image-builder/components/${var.operating_system}/files/call_ansible_from_git.yaml"
  version    = "1.0.0"
  kms_key_id = var.kms_key_arn

  depends_on = [
    aws_s3_object.this
  ]

  lifecycle {
    replace_triggered_by = [
      aws_s3_object.this
    ]
  }

  tags = merge({
    "Name" = "${var.operating_system}-Infra"
    },
  var.tags)
}
