output "rds_address" {
  value = aws_db_instance.db_instance.address
}

output "rds_password" {
  value = aws_db_instance.db_instance.password
}

