module "codedeploy" {
  source  = "git::https://github.com/von-salumbides/terraform-module.git//aws-codedeploy-app"
  env     = var.env
  project = var.project
  # compute_platform = "" // isDefined ? var.compute_platform : default==Server
}

