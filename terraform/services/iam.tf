module "iam-role-ec2" {
  source  = "git::https://github.com/von-salumbides/terraform-module.git//aws-iam-role?ref=v0.1.1"
  project = var.project
  env     = var.env
  purpose = "ec2"
  config  = "trust_services"
}

module "iam-policy-sns" {
  source      = "git::https://github.com/von-salumbides/terraform-module.git//aws-iam-policy?ref=v0.1.1"
  project     = var.project
  env         = var.env
  aws_service = "sns"
  aws_account = var.aws_account
  aws_region  = var.region
  iam_role    = [module.iam-role-ec2.name]
}

module "iam-policy-codedeploy" {
  source      = "git::https://github.com/von-salumbides/terraform-module.git//aws-iam-policy?ref=v0.1.1"
  project     = var.project
  env         = var.env
  aws_service = "codedeploy"
  aws_account = var.aws_account
  aws_region  = var.region
  iam_role    = [module.iam-role-ec2.name]
}