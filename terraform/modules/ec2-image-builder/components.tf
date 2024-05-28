resource "aws_imagebuilder_component" "custom_ansible" {
  name                  = "${var.environment}-${var.operating_system}-RunAnsibleForGoldenAMI"
  platform              = "Linux"
  supported_os_versions = ["Red Hat Enterprise Linux 8", "Oracle Enterprise Linux 8", "SUSE Linux Enterprise Server for SAP Applications 15 SP 5"]
  data                  = local.git_component_template
  version               = "1.0.0"
  kms_key_id            = var.kms_key_arn

  tags = merge({
    "Name" = "${var.operating_system}-Infra"
    },
  var.tags)
}
