# AMI OS Ubuntu architecture ARM64
data "aws_ami" "tf_aws_ami" {
  owners      = var.aws_ami_owners
  most_recent = true

  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-arm64-server-*"]
  }
}
