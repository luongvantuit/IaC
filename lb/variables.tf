variable "lb_name" {
  type    = string
  default = "tf-load-balancer"
}

variable "load_balancer_type" {
  type    = string
  default = "application"
}


variable "lb_tag_name" {
  type    = string
  default = "Load Balancer"
}

variable "lb_tag_env" {
  type    = string
  default = "Development"
}

variable "lb_internal" {
  type    = bool
  default = false
}

variable "subnets" {
  type    = list(string)
  default = []
}

variable "security_groups" {
  type    = list(string)
  default = []
}


variable "instance_ids" {
  type    = list(string)
  default = []
}

variable "vpc_id" {
  type = string
}

variable "lb_target_group_name" {
  type    = string
  default = "tf-lb-tg"
}

variable "lb_enable_deletion_protection" {
  type    = bool
  default = false
}

variable "lb_enable_cross_zone_load_balancing" {
  type    = bool
  default = true

}
