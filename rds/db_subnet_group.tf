resource "aws_db_subnet_group" "tf_db_subnet_group" {
  name       = "tf_db_subnet_group"
  subnet_ids = var.tf_subnet_ids
  tags = {
    "Name" = "DB Subnet Group"
  }
}
