output "lb_sg" {
  value = {
    id   = aws_security_group.lb_sg.id
    name = aws_security_group.lb_sg.name
  }
}

output "ec2_sg" {
  value = {
    id   = aws_security_group.ec2_sg.id
    name = aws_security_group.ec2_sg.name
  }
}

output "rds_sg" {
  value = {
    id   = aws_security_group.rds_sg.id
    name = aws_security_group.rds_sg.name
  }
}
