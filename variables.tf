variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "architecture" {
  type        = string
  default     = "x86_64"
  description = "Architecture for EC2 Remote Instance"
}
