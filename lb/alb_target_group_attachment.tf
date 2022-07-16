resource "aws_alb_target_group_attachment" "tf_alb_target_group_attachment" {
  count            = length(var.tf_instance_ids)
  target_group_arn = aws_lb_target_group.tf_lb_target_group.arn
  target_id        = var.tf_instance_ids[count.index]
}
