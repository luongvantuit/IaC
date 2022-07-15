terraform {

  # backend "remote" {
  #   organization = "luongvantuit"

  #   workspaces {
  #     name = "ausvie"
  #   }
  # }

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
  db_instance_count          = 2
  instance_public_count      = 2
  instance_public_tag_names  = ["Terraform A", "Terrform B"]
  instance_private_count     = 2
  instance_private_tag_names = ["Terraform A", "Terraform B"]
  cidr_block_public          = ["10.0.1.0/24", "10.0.4.0/24"]
  cidr_block_private         = ["10.0.2.0/24", "10.0.5.0/24"]
  cidr_block_rds             = ["10.0.3.0/24", "10.0.6.0/24"]
  availability_zone          = ["ap-southeast-1a", "ap-southeast-1b"]
}

module "key_pair" {
  source = "./key_pair"
}

module "vpc" {
  source           = "./vpc"
  ec2_instance_ids = module.ec2_public.tf_instance_ids
  subnet_define = {
    availability_zone  = local.availability_zone
    cidr_block_private = local.cidr_block_private
    cidr_block_public  = local.cidr_block_public
    cidr_block_rds     = local.cidr_block_rds
  }
}

module "sg" {
  source    = "./sg"
  tf_vpc_id = module.vpc.vpc_id
}

module "s3" {
  source           = "./s3"
  ec2_instance_ips = module.ec2_public.tf_instance_ips
}

# module "cognito" {
#   source = "./cognito"
# }

module "ec2_public" {
  source                 = "./ec2"
  tf_key_pair_name          = module.key_pair.key_pair_name
  tf_vpc_security_group_ids = [module.sg.tf_public_sg.id]
  tf_subnet_ids             = module.vpc.subnet_public_ids
  tf_instance_count_and_tag_names = {
    count     = local.instance_public_count
    tag_names = local.instance_public_tag_names
  }

  tf_os           = "linux"
  tf_architecture = "x86_64"
}
module "ec2_private" {
  source                 = "./ec2"
  tf_key_pair_name          = module.key_pair.key_pair_name
  tf_vpc_security_group_ids = [module.sg.tf_private_sg.id]
  tf_subnet_ids             = module.vpc.subnet_private_ids
  tf_instance_count_and_tag_names = {
    count     = local.instance_private_count
    tag_names = local.instance_private_tag_names
  }
  tf_os           = "linux"
  tf_architecture = "x86_64"
}

module "rds" {
  source                    = "./rds"
  tf_vpc_security_group_ids = [module.sg.tf_rds_sg.id]
  tf_subnet_ids             = module.vpc.subnet_rds_ids
  tf_rds_define = {
    availability_zone = local.availability_zone
    count             = local.db_instance_count
  }
}
