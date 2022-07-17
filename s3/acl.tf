resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  count  = length(aws_s3_bucket.s3_bucket)
  bucket = aws_s3_bucket.s3_bucket[count.index].id
  acl    = "private"
}
