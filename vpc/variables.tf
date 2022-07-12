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
