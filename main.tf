terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}


locals {
  instance_quantity = 1
  instance_names    = ["Test"]
}

module "ec2" {
  source = "./ec2"
}
