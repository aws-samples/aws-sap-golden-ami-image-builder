data "aws_security_group" "default_group" {
  vpc_id = var.vpc_id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}
