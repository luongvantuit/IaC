resource "aws_instance" "instances" {
  ami                    = var.os == "linux" ? data.aws_ami.ami_linux.id : data.aws_ami.ami_ubuntu.id
  key_name               = var.key_pair_name
  vpc_security_group_ids = var.vpc_security_group_ids
  security_groups        = var.security_groups
  count                  = var.instance_count_and_tag_names.count
  instance_type          = var.architecture == "arm64" ? var.instance_type_arm64 : var.instance_type_x86_64
  subnet_id              = var.subnet_ids[count.index]
  tags = {
    "Name" = var.instance_count_and_tag_names.tag_names[count.index]
  }

  lifecycle {
    create_before_destroy = true
  }
}
