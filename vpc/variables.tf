variable "vpc_tag_name" {
  type        = string
  default     = "Terraform VPC"
  description = "Tag name of AWS VPC"
}

variable "internet_gateway_name" {
  type    = string
  default = "ig"
}

variable "nat_gateway_tag_name" {
  type    = string
  default = "NAT Gateway"
}

variable "subnet_info" {
  type = object({
    cidr_block_public  = list(string)
    cidr_block_private = list(string)
    cidr_block_rds     = list(string)
    availability_zones = list(string)
  })
  default = {
    availability_zones = []
    cidr_block_private = []
    cidr_block_public  = []
    cidr_block_rds     = []
  }
}

variable "region" {
  type    = string
  default = "ap-southeast-1"
}
