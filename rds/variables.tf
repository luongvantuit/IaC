variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "db_subnet_group_name" {
  type    = string
  default = "db_subnet_group"
}

variable "db_subnet_group_tag_name" {
  type    = string
  default = "DB Subnet Group"
}

variable "rds_info" {
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

variable "rds_instance_class" {
  type    = string
  default = "db.t2.micro"
}
