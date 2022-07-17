resource "aws_security_group" "lb_sg" {
  name        = var.lb_sg_name
  description = "Security group load balancer"
  vpc_id      = var.vpc_id
  tags = {
    "Name" = var.lb_sg_tag_name
    "Role" = "public"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = var.ec2_sg_name
  description = "Security group EC2"
  vpc_id      = var.vpc_id
  tags = {
    "Name" = var.ec2_sg_tag_name
    "Role" = "private"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = var.rds_sg_name
  description = "Security group RDS"
  vpc_id      = var.vpc_id
  tags = {
    "Name" = var.rds_sg_tag_name
    "Role" = "private"
  }
}
