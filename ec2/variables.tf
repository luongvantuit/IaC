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

  validation {
    condition = contains(["a1.medium", "a1.large", "a1.xlarge", "a1.2xlarge", "a1.4xlarge", "a1.metal", "c6g.medium", "c6g.large", "c6g.xlarge", "c6g.2xlarge",
      "c6g.4xlarge", "c6g.8xlarge", "c6g.12xlarge", "c6g.16xlarge", "c6g.metal", "c6gd.medium", "c6gd.large", "c6gd.xlarge", "c6gd.2xlarge", "c6gd.4xlarge", "c6gd.8xlarge",
      "c6gd.12xlarge", "c6gd.16xlarge", "c6gd.metal", "c6gn.medium", "c6gn.large", "c6gn.xlarge", "c6gn.2xlarge", "c6gn.4xlarge", "c6gn.8xlarge", "c6gn.12xlarge",
      "c6gn.16xlarge", "c6gn.metal", "g5g.xlarge", "g5g.2xlarge", "g5g.4xlarge", "g5g.8xlarge", "g5g.16xlarge", "g5g.metal", "m6g.medium", "m6gd.large", "m6gd.xlarge", "m6gd.2xlarge",
      "m6g.4xlarge", "m6g.8xlarge", "m6g.12xlarge", "m6g.16xlarge", "m6g.metal", "m6g.medium", "m6g.large", "m6g.xlarge", "m6g.2xlarge",
      "m6gd.4xlarge", "m6gd.8xlarge", "m6gd.12xlarge", "m6gd.16xlarge", "m6gd.metal", "r6g.medium", "r6g.large", "r6g.xlarge", "r6g.2xlarge",
      "r6g.4xlarge", "r6g.8xlarge", "r6g.12xlarge", "r6g.16xlarge", "r6g.metal", "r6gd.medium", "r6gd.large", "r6gd.xlarge", "r6gd.2xlarge",
    "r6gd.4xlarge", "r6gd.8xlarge", "r6gd.12xlarge", "r6gd.16xlarge", "r6gd.metal", "t4g.nano", "t4g.micro", "t4g.small", "t4g.medium", "t4g.large", "t4g.xlarge", "t4g.2xlarge"], var.instance_type)
    error_message = "Instance type is not supported for architecture ARM64"
  }
}
