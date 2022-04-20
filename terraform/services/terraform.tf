terraform {
  required_version = ">= 1.1.7"
  backend "s3" {
    encrypt = "true"
    bucket  = "devops-poc-bucket"
    region  = "us-east-2"
    key     = "tf/devops-dev.tfstate"
  }
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