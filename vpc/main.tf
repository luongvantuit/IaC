resource "aws_vpc" "tf_vpc" {
  instance_tenancy     = "default"
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_tag_name
  }
}
