resource "aws_security_group_rule" "tf_allow_internet_outside" {
  type              = "egress"
  protocol          = "-1"
  to_port           = 0
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::0/0"]
  description       = "Allow internet, enable update, upgrade install packages and interact with service outside"
  security_group_id = aws_security_group.tf_public_sg.id
}
