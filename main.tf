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
  instance_count     = 1
  instance_tag_names = ["Terraform"]
}

module "key_pair" {
  source = "./key_pair"
}

module "sg" {
  source    = "./sg"
  tf_vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source           = "./vpc"
  ec2_instance_ids = module.ec2.tf_ubuntu_instance_ids
}

module "s3" {
  source = "./s3"
  ec2_instance_public_ips = module.ec2.tf_ubuntu_instance_public_ips
}

module "cognito" {
  source = "./cognito"
}

module "ec2" {
  source                 = "./ec2"
  key_pair_name          = module.key_pair.key_pair_name
  security_groups        = [module.sg.tf_public_sg.name]
  vpc_security_group_ids = [module.sg.tf_public_sg.id]
  instance_count_and_tag_names = {
    count     = local.instance_count
    tag_names = local.instance_tag_names
  }
}
