resource "aws_nat_gateway" "tf_nat_gw" {
  depends_on = [
    aws_internet_gateway.tf_internet_gw
  ]

  allocation_id = aws_eip.tf_eip_nat.id
  subnet_id     = aws_subnet.tf_subnet_public[0].id

  tags = {
    "Name" = "NAT Gateway"
  }
}
