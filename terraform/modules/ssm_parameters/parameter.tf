resource "aws_ssm_parameter" "parameters" {
  for_each = var.params_to_create

  name  = "/${var.environment}/${each.key}"
  type  = each.value["type"]
  value = each.value["value"]
}
