variable "tf_vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "tf_subnet_ids" {
  type    = list(string)
  default = []
}

variable "tf_db_subnet_group_name" {
  type    = string
  default = "tf_db_subnet_group"
}

variable "tf_db_subnet_group_tag_name" {
  type    = string
  default = "DB Subnet Group"
}

variable "tf_rds_info" {
  type = object({
    name                = string
    identifier          = string
    username            = string
    publicly_accessible = bool
  })
  default = {
    identifier          = "luongvantuit"
    name                = "dev"
    username            = "luongvantuit"
    publicly_accessible = false
  }
}

variable "tf_rds_instance_class" {
  type    = string
  default = "db.t2.micro"
}
