variable "tf_vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "tf_subnet_ids" {
  type    = list(string)
  default = []
}

variable "tf_rds_define" {
  type = object({
    count             = number
    availability_zone = list(string)
  })
}
