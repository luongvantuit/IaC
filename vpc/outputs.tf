output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_public_ids" {
  value = [for i in aws_subnet.subnet_public : i.id]
}


output "subnet_private_ids" {
  value = [for i in aws_subnet.subnet_private : i.id]
}

output "subnet_rds_ids" {
  value = [for i in aws_subnet.subnet_rds : i.id]
}
