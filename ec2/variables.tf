variable "key_pair_name" {
  type        = string
  description = "File name of the key pair SSH"
  default     = "key_pair"
}

# List of name security groups
variable "security_groups" {
  type        = list(string)
  default     = []
  description = "List of name security groups"
}

# List of security group ids
variable "vpc_security_group_ids" {
  type        = list(string)
  default     = []
  description = "List of security group ids"
}

variable "instance_define" {
  type = object({
    quantity  = number
    tag_names = list(string)
  })
  default = {
    quantity  = 1
    tag_names = ["Terraform"]
  }
}
