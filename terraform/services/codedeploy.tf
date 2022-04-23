module "codedeploy" {
  source  = "git::https://github.com/von-salumbides/terraform-module.git//aws-codedeploy-app"
  env     = var.env
  project = var.project
  # compute_platform = "" // isDefined ? var.compute_platform : default==Server
}

module "codedeploy-group" {
  source       = "git::https://github.com/von-salumbides/terraform-module.git//aws-codedeploy-deploymentgroup-ec2"
  env          = var.env
  project      = var.project
  purpose      = "ec2"
  config       = "ec2_tag_filter"
  iam-role-ec2 = module.iam-role-ec2.id
  app_name     = module.codedeploy.name
}