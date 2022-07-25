resource "aws_subnet" "subnet_public" {
  count                   = length(var.subnet_info.cidr_block_public)
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block              = var.subnet_info.cidr_block_public[count.index]
  availability_zone       = var.subnet_info.availability_zones[count.index % length(var.subnet_info.cidr_block_public)]
  tags = {
    "Name" = "Subnet public"
  }
}

resource "aws_subnet" "subnet_private" {
  count             = length(var.subnet_info.cidr_block_private)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_info.cidr_block_private[count.index]
  availability_zone = var.subnet_info.availability_zones[count.index % length(var.subnet_info.cidr_block_private)]
  depends_on = [
    aws_internet_gateway.internet_gw
  ]
  tags = {
    "Name" = "Subnet private"
  }
}

resource "aws_subnet" "subnet_rds" {
  count             = length(var.subnet_info.cidr_block_rds)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_info.cidr_block_rds[count.index]
  availability_zone = var.subnet_info.availability_zones[count.index % length(var.subnet_info.cidr_block_rds)]
  tags = {
    "Name" = "Subnet RDS"
  }
}


