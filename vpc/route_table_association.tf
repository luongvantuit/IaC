resource "aws_route_table_association" "tf_route_table_association_public" {
  for_each       = { for key, value in aws_subnet.tf_subnet_public : key => value }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.tf_route_table_public.id
}

resource "aws_route_table_association" "tf_route_table_association_private" {
  for_each       = { for key, value in aws_subnet.tf_subnet_private : key => value }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.tf_route_table_private.id
}

resource "aws_route_table_association" "tf_route_table_association_rds" {
  for_each       = { for key, value in aws_subnet.tf_subnet_rds : key => value }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.tf_route_table_rbs.id
}


