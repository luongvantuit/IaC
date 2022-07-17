variable "lb_sg_name" {
  type    = string
  default = "lb_sg"
}

variable "lb_sg_tag_name" {
  type    = string
  default = "Terraform load balandcer security group"
}

variable "ec2_sg_name" {
  type    = string
  default = "ec2_sg"
}

variable "ec2_sg_tag_name" {
  type    = string
  default = "Terraform EC2 security group"
}

variable "rds_sg_name" {
  type    = string
  default = "rds_sg"
}

variable "rds_sg_tag_name" {
  type    = string
  default = "Terraform RDS security group"
}

variable "vpc_id" {
  type = string
}
