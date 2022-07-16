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
  region  = var.tf_region
}

locals {
  instance_ec2_count     = 2
  instance_ec2_tag_names = ["Terraform A", "Terrform B"]
  cidr_block_lb          = ["10.0.1.0/24", "10.0.4.0/24"]
  cidr_block_ec2         = ["10.0.2.0/24", "10.0.5.0/24"]
  cidr_block_rds         = ["10.0.3.0/24", "10.0.6.0/24"]
}

module "tf_key_pair" {
  source = "./key_pair"
}

module "tf_vpc" {
  source = "./vpc"
  tf_subnet_info = {
    availability_zone  = data.aws_availability_zones.tf_availability_zones.names
    cidr_block_private = local.cidr_block_ec2
    cidr_block_public  = local.cidr_block_lb
    cidr_block_rds     = local.cidr_block_rds
  }
}

module "tf_sg" {
  source    = "./sg"
  tf_vpc_id = module.tf_vpc.tf_vpc_id
}

# module "s3" {
#   source           = "./s3"
#   ec2_instance_ips = module.ec2_public.tf_instance_ips
# }

# module "cognito" {
#   source = "./cognito"
# }

module "tf_lb" {
  source             = "./lb"
  tf_security_groups = [module.tf_sg.tf_lb_sg.id]
  tf_subnets         = module.tf_vpc.tf_subnet_public_ids
  tf_instance_ids    = module.tf_ec2.tf_instance_ids
  tf_vpc_id          = module.tf_vpc.tf_vpc_id
}

module "tf_ec2" {
  source                    = "./ec2"
  tf_key_pair_name          = module.tf_key_pair.tf_key_pair_name
  tf_vpc_security_group_ids = [module.tf_sg.tf_ec2_sg.id]
  tf_subnet_ids             = module.tf_vpc.tf_subnet_private_ids
  tf_os                     = "ubuntu"
  tf_architecture           = "arm64"
  tf_instance_count_and_tag_names = {
    count     = local.instance_ec2_count
    tag_names = local.instance_ec2_tag_names
  }
}

module "tf_rds" {
  source                    = "./rds"
  tf_vpc_security_group_ids = [module.tf_sg.tf_rds_sg.id]
  tf_subnet_ids             = module.tf_vpc.tf_subnet_rds_ids
}


resource "aws_eip" "name" {
  vpc      = true
  instance = module.tf_ec2_test.tf_instance_ids[0]
}

module "tf_ec2_test" {
  source                    = "./ec2"
  tf_key_pair_name          = module.tf_key_pair.tf_key_pair_name
  tf_vpc_security_group_ids = [module.tf_sg.tf_ec2_sg.id]
  tf_subnet_ids             = module.tf_vpc.tf_subnet_public_ids
  tf_os                     = "ubuntu"
  tf_architecture           = "arm64"
  tf_instance_count_and_tag_names = {
    count     = 1
    tag_names = ["Test"]
  }
}
