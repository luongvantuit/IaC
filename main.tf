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
  region  = var.region
}

locals {
  instance_ec2_count     = 2
  instance_ec2_tag_names = ["Terraform A", "Terrform B"]
  cidr_block_lb          = ["10.0.1.0/24", "10.0.4.0/24"]
  cidr_block_ec2         = ["10.0.2.0/24", "10.0.5.0/24"]
  cidr_block_rds         = ["10.0.3.0/24", "10.0.6.0/24"]
}

module "key_pair" {
  source = "./key_pair"
}

module "vpc" {
  source = "./vpc"
  subnet_info = {
    availability_zones = data.aws_availability_zones.availability_zones.names
    cidr_block_private = local.cidr_block_ec2
    cidr_block_public  = local.cidr_block_lb
    cidr_block_rds     = local.cidr_block_rds
  }
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "s3" {
  source           = "./s3"
  ec2_instance_ips = module.ec2.instance_private_ips
}

module "cognito" {
  source = "./cognito"
}

module "lb" {
  source          = "./lb"
  security_groups = [module.sg.lb_sg.id]
  subnets         = module.vpc.subnet_public_ids
  instance_ids    = module.ec2.instance_ids
  vpc_id          = module.vpc.vpc_id
}

module "ec2" {
  source                 = "./ec2"
  key_pair_name          = module.key_pair.key_pair_name
  vpc_security_group_ids = [module.sg.ec2_sg.id]
  subnet_ids             = module.vpc.subnet_private_ids
  os                     = "ubuntu"
  architecture           = "arm64"
  instance_count_and_tag_names = {
    count     = local.instance_ec2_count
    tag_names = local.instance_ec2_tag_names
  }
}

module "rds" {
  source                 = "./rds"
  vpc_security_group_ids = [module.sg.rds_sg.id]
  subnet_ids             = module.vpc.subnet_rds_ids
}
