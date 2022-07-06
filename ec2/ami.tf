data "aws_ami" "tf_ami_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "architecture"
    values = [var.architecture]
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
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-*"]
  }
}

data "aws_ami" "tf_ami_linux" {

  owners      = ["602401143452"]
  most_recent = true
  filter {
    name   = "architecture"
    values = [var.architecture]
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
    values = ["amazon/amzn2-ami-kernel-5.10-hvm-*"]
  }
}
