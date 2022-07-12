variable "vpc_tag_name" {
  type        = string
  default     = "Terraform VPC"
  description = "Tag name of AWS VPC"
}

variable "ec2_instance_ids" {
  type    = list(string)
  default = []
}


variable "internet_gateway_name" {
  type    = string
  default = "Terrafrom GW"
}

variable "subnet_define" {
  type = object({
    cidr_block_private = list(string)
    cidr_block_public  = list(string)
    cidr_block_rds     = list(string)
    availability_zone  = list(string)
  })

  default = {
    cidr_block_public  = ["10.0.1.0/24"]
    cidr_block_private = ["10.0.2.0/24"]
    cidr_block_rds     = ["10.0.3.0/24"]
    availability_zone  = ["ap-southeast-1a"]
  }
}
