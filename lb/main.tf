resource "aws_lb" "tf_lb" {
  name                             = var.tf_lb_name
  internal                         = false
  subnets                          = var.tf_subnets
  security_groups                  = var.tf_security_groups
  load_balancer_type               = "application"
  ip_address_type                  = "ipv4"
  enable_deletion_protection       = var.tf_lb_enable_deletion_protection
  enable_cross_zone_load_balancing = var.tf_lb_enable_cross_zone_load_balancing
  tags = {
    "Name"        = var.tf_lb_tag_name
    "Environment" = var.tf_lb_tag_env
  }
}

