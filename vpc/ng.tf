resource "aws_nat_gateway" "nat_gw" {

  depends_on = [
    aws_internet_gateway.internet_gw
  ]

  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.subnet_public[0].id

  tags = {
    "Name" = var.nat_gateway_tag_name
  }
}
