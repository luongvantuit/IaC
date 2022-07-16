variable "tf_lb_name" {
  type    = string
  default = "tf-load-balancer"
}

variable "tf_load_balancer_type" {
  type    = string
  default = "application"
}


variable "tf_lb_tag_name" {
  type    = string
  default = "Load Balancer"
}

variable "tf_lb_tag_env" {
  type    = string
  default = "Development"
}

variable "tf_lb_internal" {
  type    = bool
  default = false
}

variable "tf_subnets" {
  type    = list(string)
  default = []
}

variable "tf_security_groups" {
  type    = list(string)
  default = []
}


variable "tf_instance_ids" {
  type    = list(string)
  default = []
}

variable "tf_vpc_id" {
  type = string
}

variable "tf_lb_target_group_name" {
  type    = string
  default = "tf-lb-tg"
}

variable "tf_lb_enable_deletion_protection" {
  type    = bool
  default = false
}

variable "tf_lb_enable_cross_zone_load_balancing" {
  type    = bool
  default = true

}
