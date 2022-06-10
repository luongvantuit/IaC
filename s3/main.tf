resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = var.s3_bucket[count.index]
  count  = var.s3_bucket_count_and_tag_names.count
  tags = {
    "Name" = var.s3_bucket_count_and_tag_names.tag_names[count.index]
  }
}
