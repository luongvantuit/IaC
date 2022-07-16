variable "tf_vpc_tag_name" {
  type        = string
  default     = "Terraform VPC"
  description = "Tag name of AWS VPC"
}

variable "tf_internet_gateway_name" {
  type    = string
  default = "tf_ig"
}

variable "tf_nat_gateway_tag_name" {
  type    = string
  default = "NAT Gateway"
}

variable "tf_subnet_info" {
  type = object({
    cidr_block_public  = list(string)
    cidr_block_private = list(string)
    cidr_block_rds     = list(string)
    availability_zone  = list(string)
  })
  default = {
    availability_zone  = []
    cidr_block_private = []
    cidr_block_public  = []
    cidr_block_rds     = []
  }
}

variable "tf_region" {
  type    = string
  default = "ap-southeast-1"
}