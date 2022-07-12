resource "aws_db_instance" "tf_db_instance" {
  allocated_storage      = 20
  vpc_security_group_ids = var.tf_vpc_security_group_ids
  engine                 = "postgres"
  engine_version         = "12.7"
  instance_class         = "db.t2.micro"
  identifier             = "ausvie0906"
  name                   = "terraform0"
  username               = "admin123456"
  password               = "admin123456"
  db_subnet_group_name   = aws_db_subnet_group.tf_db_subnet_group.name
  skip_final_snapshot    = true
}
