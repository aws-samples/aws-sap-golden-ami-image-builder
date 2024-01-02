variable "aws_region" {
  description = "Region where to run this TF in"
  type        = string
}

variable "environment" {
  description = "Environment to be used for this run"
  type        = string
}

variable "params_to_create" {
  description = "Map of parameters to be created"
  type        = map(map(string))
}
