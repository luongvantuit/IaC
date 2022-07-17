resource "aws_security_group_rule" "lb_allow_http" {
  to_port           = 80
  from_port         = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  description       = "Allow HTTP request access on port 80"
  security_group_id = aws_security_group.lb_sg.id
  protocol          = "tcp"
}

resource "aws_security_group_rule" "ec2_allow_http" {
  to_port           = 80
  from_port         = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  description       = "Allow HTTP request access on port 80"
  security_group_id = aws_security_group.ec2_sg.id
  protocol          = "tcp"
}

resource "aws_security_group_rule" "ec2_allow_ssh" {
  to_port           = 22
  from_port         = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  description       = "Allow SSH EC2 access on port 22"
  security_group_id = aws_security_group.ec2_sg.id
  protocol          = "tcp"
}

resource "aws_security_group_rule" "allow_connect_rds" {
  to_port           = 5432
  from_port         = 5432
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  type              = "ingress"
  security_group_id = aws_security_group.rds_sg.id
  protocol          = "-1"
}
