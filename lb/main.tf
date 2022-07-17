resource "aws_lb" "lb" {
  name                             = var.lb_name
  internal                         = false
  subnets                          = var.subnets
  security_groups                  = var.security_groups
  load_balancer_type               = "application"
  ip_address_type                  = "ipv4"
  enable_deletion_protection       = var.lb_enable_deletion_protection
  enable_cross_zone_load_balancing = var.lb_enable_cross_zone_load_balancing
  tags = {
    "Name"        = var.lb_tag_name
    "Environment" = var.lb_tag_env
  }
}

