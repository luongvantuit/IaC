variable "key_pair_name" {
  type        = string
  description = "File name of the key pair SSH"
}

variable "aws_ami_owners" {
  type    = list(string)
  default = ["099720109477"]
}
