resource "aws_db_subnet_group" "tf_db_subnet_group" {
  name       = var.tf_db_subnet_group_name
  subnet_ids = var.tf_subnet_ids
  tags = {
    "Name" = var.tf_db_subnet_group_tag_name
  }
}
