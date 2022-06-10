resource "aws_s3_bucket_versioning" "tf_s3_bucket_versioning" {
  count  = length(aws_s3_bucket.tf_s3_bucket)
  bucket = aws_s3_bucket.tf_s3_bucket[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}
