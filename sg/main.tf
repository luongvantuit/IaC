resource "aws_security_group" "tf_public_sg" {
  name        = var.tf_public_sg_name
  description = "Security group public"
  vpc_id      = var.tf_vpc_id
  tags = {
    "Name" = var.tf_public_sg_tag_name
    "Role" = "public"
  }
}

resource "aws_security_group" "tf_private_sg" {
  name        = var.tf_private_sg_name
  description = "Security group private"
  vpc_id      = var.tf_vpc_id
  tags = {
    "Name" = var.tf_private_sg_tag_name
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
