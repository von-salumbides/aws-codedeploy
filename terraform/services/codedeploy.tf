module "codedeploy" {
  source  = "git::https://github.com/von-salumbides/terraform-module.git//aws-codedeploy-app"
  env     = var.env
  project = var.project
  # compute_platform = "" // isDefined ? var.compute_platform : default==Server
}

resource "aws_sns_topic" "this" {
  name = "${var.project}-codedeploy-${var.env}"
}

resource "aws_codedeploy_deployment_group" "this" {
  app_name              = module.codedeploy.name
  deployment_group_name = "${var.project}-${var.env}"
  service_role_arn      = module.iam-role-ec2.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "APPLICATION"
      type  = "KEY_AND_VALUE"
      value = "DEVOPS"
    }
  }

  trigger_configuration {
    trigger_events     = ["DeploymentFailure"]
    trigger_name       = "example-trigger"
    trigger_target_arn = aws_sns_topic.this.arn
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }
}