output "tf_public_sg" {
  value = {
    id   = aws_security_group.tf_public_sg.id
    name = aws_security_group.tf_public_sg.name
  }
}

output "tf_private_sg" {
  value = {
    id   = aws_security_group.tf_private_sg.id
    name = aws_security_group.tf_private_sg.name
  }
}

output "tf_rds_sg" {
  value = {
    id   = aws_security_group.tf_rds_sg.id
    name = aws_security_group.tf_rds_sg.name
  }
}
