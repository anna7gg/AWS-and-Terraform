terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.3"
    }
  }

  cloud {
    hostname     = "app.terraform.io"
    organization = "Anna-ops"
    workspaces {
      name = "servers"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "admin_terra"
  region  = var.region
#  default_tags {
#    Name = "ops-app-${var.env}"
#    environment = var.env
#    owner = "Anna-g"
#  }
}
