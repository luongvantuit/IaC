data "aws_availability_zones" "tf_availability_zones" {
  state = "available"
  filter {
    name   = "region-name"
    values = [var.tf_region]
  }
}
