output "tf_lb_sg" {
  value = {
    id   = aws_security_group.tf_lb_sg.id
    name = aws_security_group.tf_lb_sg.name
  }
}

output "tf_ec2_sg" {
  value = {
    id   = aws_security_group.tf_ec2_sg.id
    name = aws_security_group.tf_ec2_sg.name
  }
}

output "tf_rds_sg" {
  value = {
    id   = aws_security_group.tf_rds_sg.id
    name = aws_security_group.tf_rds_sg.name
  }
}
