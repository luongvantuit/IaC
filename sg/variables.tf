variable "tf_public_sg_name" {
  type    = string
  default = "tf_public_sg"
}

variable "tf_public_sg_tag_name" {
  type    = string
  default = "Terraform public security group"
}

variable "tf_private_sg_name" {
  type    = string
  default = "tf_private_sg"
}

variable "tf_private_sg_tag_name" {
  type    = string
  default = "Terraform private security group"
}


variable "tf_vpc_id" {
  type = string
}
