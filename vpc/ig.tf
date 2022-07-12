resource "aws_internet_gateway" "tf_internet_gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    "Name" = var.internet_gateway_name
  }
}
