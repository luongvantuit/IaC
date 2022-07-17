resource "aws_security_group_rule" "ec2_allow_internet_outside" {
  type              = "egress"
  protocol          = "-1"
  to_port           = 0
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow internet, enable update, upgrade install packages and interact with service outside"
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "lb_allow_internet_outside" {
  type              = "egress"
  protocol          = "-1"
  to_port           = 0
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow internet outside"
  security_group_id = aws_security_group.lb_sg.id
}
