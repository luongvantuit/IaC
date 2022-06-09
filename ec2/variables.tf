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

variable "instance_count_and_tag_names" {
  type = object({
    count     = number
    tag_names = list(string)
  })
  default = {
    count     = 1
    tag_names = ["Terraform"]
  }

  description = "Setup quantity of instance and tag names for that"
  validation {
    condition     = length(var.instance_count_and_tag_names.tag_names) == var.instance_count_and_tag_names.count
    error_message = "Error set tag names of instance & quantity instance"
  }
}

variable "instance_type" {
  type        = string
  default     = "c6g.medium"
  description = "Set instance type of ec instance"
}
