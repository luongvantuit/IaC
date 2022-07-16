resource "aws_lb_target_group" "tf_lb_target_group" {
  health_check {
    port                = 80
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    path                = "/"
    timeout             = 3
    interval            = 30
  }
  name        = var.tf_lb_target_group_name
  vpc_id      = var.tf_vpc_id
  protocol    = "HTTP"
  port        = 80
  target_type = "instance"
}
