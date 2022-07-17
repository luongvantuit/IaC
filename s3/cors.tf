resource "aws_s3_bucket_cors_configuration" "s3_bucket_cors_configuration" {
  count  = length(aws_s3_bucket.s3_bucket)
  bucket = aws_s3_bucket.s3_bucket[count.index].id
  cors_rule {
    allowed_headers = ["*"]
    allowed_origins = var.ec2_instance_ips
    allowed_methods = ["PUT", "POST", "DELETE"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_cors_configuration" "s3_bucket_cors_configuration_allow_get_resource" {
  count  = length(aws_s3_bucket.s3_bucket)
  bucket = aws_s3_bucket.s3_bucket[count.index].id
  cors_rule {
    allowed_origins = ["*"]
    allowed_methods = ["GET"]
  }
}
