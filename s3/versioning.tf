resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  count  = length(aws_s3_bucket.s3_bucket)
  bucket = aws_s3_bucket.s3_bucket[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}
