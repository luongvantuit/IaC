variable "ec2_instance_public_ips" {
  type    = list(string)
  default = []
}

variable "s3_bucket" {
  type    = list(string)
  default = ["luongvantuit"]
}

variable "s3_bucket_count_and_tag_names" {
  type = object({
    count     = number
    tag_names = list(string)
  })
  default = {
    count     = 1
    tag_names = ["Terraform S3 Bucket"]
  }

  validation {
    condition     = length(var.s3_bucket_count_and_tag_names.tag_names) == var.s3_bucket_count_and_tag_names.count
    error_message = "Error set tag names of bucket & quantity"
  }
}
