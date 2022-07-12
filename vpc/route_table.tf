resource "aws_route_table" "tf_route_table_public" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_internet_gw.id
  }

  tags = {
    "Name" = "Route Table Public"
  }
}


resource "aws_route_table" "tf_route_table_private" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_nat_gw.id
  }

  tags = {
    "Name" = "Route Table Public"
  }
}


resource "aws_route_table" "tf_route_table_rbs" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_nat_gw.id
  }

  tags = {
    "Name" = "Route Table RDS"
  }
}
