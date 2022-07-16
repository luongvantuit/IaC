output "tf_rds_address" {
  value = aws_db_instance.tf_db_instance.address
}

output "tf_rds_password" {
  value = aws_db_instance.tf_db_instance.password
}

