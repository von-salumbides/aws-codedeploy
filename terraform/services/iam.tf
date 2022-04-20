module "iam-role-ec2" {
  source  = "git::https://github.com/von-salumbides/terraform-module.git//aws-iam-role"
  project = var.project
  env     = var.env
  purpose = "ec2"
  config  = "trust_services"
}