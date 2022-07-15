resource "aws_security_group" "tf_lb_sg" {
  name        = var.tf_lb_sg_name
  description = "Security group load balancer"
  vpc_id      = var.tf_vpc_id
  tags = {
    "Name" = var.tf_lb_sg_tag_name
    "Role" = "public"
  }
}

resource "aws_security_group" "tf_ec2_sg" {
  name        = var.tf_ec2_sg_name
  description = "Security group EC2"
  vpc_id      = var.tf_vpc_id
  tags = {
    "Name" = var.tf_ec2_sg_tag_name
    "Role" = "private"
  }
}


resource "aws_security_group" "tf_rds_sg" {
  name        = var.tf_rds_sg_name
  description = "Security group RDS"
  vpc_id      = var.tf_vpc_id
  tags = {
    "Name" = var.tf_rds_sg_tag_name
  }
}
