resource "aws_db_instance" "tf_db_instance" {
  allocated_storage      = 20
  vpc_security_group_ids = var.tf_vpc_security_group_ids
  engine                 = "postgres"
  engine_version         = "12.7"
  instance_class         = var.tf_rds_instance_class
  identifier             = var.tf_rds_info.identifier
  name                   = var.tf_rds_info.name
  username               = var.tf_rds_info.username
  password               = random_password.tf_random_password.result
  db_subnet_group_name   = aws_db_subnet_group.tf_db_subnet_group.name
  skip_final_snapshot    = true
  publicly_accessible    = var.tf_rds_info.publicly_accessible
  lifecycle {
    ignore_changes = [

    ]
  }
}
