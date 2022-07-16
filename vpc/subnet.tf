resource "aws_subnet" "tf_subnet_public" {
  count                   = length(var.tf_subnet_info.cidr_block_public)
  vpc_id                  = aws_vpc.tf_vpc.id
  map_public_ip_on_launch = true
  cidr_block              = var.tf_subnet_info.cidr_block_public[count.index]
  availability_zone       = var.tf_subnet_info.availability_zone[count.index % length(var.tf_subnet_info.cidr_block_public)]
  tags = {
    "Name" = "Subnet public"
  }
}

resource "aws_subnet" "tf_subnet_private" {
  count             = length(var.tf_subnet_info.cidr_block_private)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.tf_subnet_info.cidr_block_private[count.index]
  availability_zone = var.tf_subnet_info.availability_zone[count.index % length(var.tf_subnet_info.cidr_block_public)]
  depends_on = [
    aws_internet_gateway.tf_internet_gw
  ]
  tags = {
    "Name" = "Subnet private"
  }
}

resource "aws_subnet" "tf_subnet_rds" {
  count             = length(var.tf_subnet_info.cidr_block_rds)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.tf_subnet_info.cidr_block_rds[count.index]
  availability_zone = var.tf_subnet_info.availability_zone[count.index % length(var.tf_subnet_info.cidr_block_public)]
  tags = {
    "Name" = "Subnet RDS"
  }
}


