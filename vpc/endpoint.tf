resource "aws_vpc_endpoint" "tf_vpc_endpoint_s3" {
  vpc_id       = aws_vpc.tf_vpc.id
  service_name = "com.amazonaws.ap-southeast-1.s3"
}
