variable "tf_lb_sg_name" {
  type    = string
  default = "tf_lb_sg"
}

variable "tf_lb_sg_tag_name" {
  type    = string
  default = "Terraform load balandcer security group"
}

variable "tf_ec2_sg_name" {
  type    = string
  default = "tf_ec2_sg"
}

variable "tf_ec2_sg_tag_name" {
  type    = string
  default = "Terraform EC2 security group"
}

variable "tf_rds_sg_name" {
  type    = string
  default = "tf_rds_sg"
}

variable "tf_rds_sg_tag_name" {
  type    = string
  default = "Terraform RDS security group"
}

variable "tf_vpc_id" {
  type = string
}
