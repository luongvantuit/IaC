resource "aws_security_group" "tf_public_sg" {
  name        = var.tf_public_sg_name
  description = "Security group public"
  tags = {
    "Name" = var.tf_public_sg_tag_name
  }
}

resource "aws_security_group" "tf_private_sg" {
  name        = var.tf_private_sg_name
  description = "Security group private"
  tags = {
    "Name" = var.tf_private_sg_tag_name
  }
}
