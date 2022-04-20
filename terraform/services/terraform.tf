terraform {
  required_version = ">= 1.1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      APPLICATION = upper(var.project)
      COST_CENTER = upper(var.cost_center)
      ENVIRONMENT = upper(var.env)
      Terraform   = true
      Owner       = upper(var.owner)
    }
  }
}