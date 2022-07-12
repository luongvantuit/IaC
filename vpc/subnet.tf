resource "aws_subnet" "tf_subnet_public" {
  count             = length(var.subnet_define.availability_zone)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.subnet_define.cidr_block_public[count.index]
  availability_zone = var.subnet_define.availability_zone[count.index]
  tags = {
    "Name" : "Subnet public"
  }
}

resource "aws_subnet" "tf_subnet_private" {
  count             = length(var.subnet_define.availability_zone)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.subnet_define.cidr_block_private[count.index]
  availability_zone = var.subnet_define.availability_zone[count.index]
  tags = {
    "Name" : "Subnet private"
  }
}

resource "aws_subnet" "tf_subnet_rds" {
  count             = length(var.subnet_define.availability_zone)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.subnet_define.cidr_block_rds[count.index]
  availability_zone = var.subnet_define.availability_zone[count.index]
  tags = {
    "Name" : "Subnet RDS"
  }
}


