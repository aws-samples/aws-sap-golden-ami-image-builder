locals {
  tags = {
    "ProjectID"  = "1234"
    "ProjectDescription"  = "SAP Golden AMIs"
    "CostCenter" = "cost"
    "Product"    = var.app_name
    "Owner"      = "IT"
    "Environment"    = var.environment
    "ManagedBy"  = "Terraform"
    "GitHubRepo" = "https://github.com/guisesterheim/sap-ec2-image-builder"
  }
}
