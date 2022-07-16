resource "aws_lb_listener" "tf_lb_listener" {
  load_balancer_arn = aws_lb.tf_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tf_lb_target_group.arn
    type             = "forward"
  }
}
