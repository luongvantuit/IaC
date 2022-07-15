resource "aws_lb" "tf_lb" {
  subnets         = var.tf_subnets
  security_groups = []
}
