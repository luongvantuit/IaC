resource "aws_db_instance" "db_instance" {
  allocated_storage      = 20
  vpc_security_group_ids = var.vpc_security_group_ids
  engine                 = "postgres"
  engine_version         = "12.7"
  instance_class         = var.rds_instance_class
  identifier             = var.rds_info.identifier
  name                   = var.rds_info.name
  username               = var.rds_info.username
  password               = random_password.random_password.result
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true
  publicly_accessible    = var.rds_info.publicly_accessible
  lifecycle {
    ignore_changes = [

    ]
  }
}
