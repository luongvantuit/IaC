resource "aws_alb_target_group_attachment" "alb_target_group_attachment" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = var.instance_ids[count.index]
}
