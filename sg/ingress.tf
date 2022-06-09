resource "aws_security_group_rule" "tf_allow_ssh" {
  to_port           = 22
  from_port         = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  description       = "Allow SSH access on port 22"
  security_group_id = aws_security_group.tf_public_sg.id
  protocol          = "tcp"
}

resource "aws_security_group_rule" "tf_allow_https" {
  to_port           = 443
  from_port         = 443
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  description       = "Allow HTTPS request access on port 443"
  security_group_id = aws_security_group.tf_public_sg.id
  protocol          = "tcp"
}
