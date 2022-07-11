resource "aws_instance" "tf_instances" {
  ami                    = var.os == "linux" ? data.aws_ami.tf_ami_linux.id : data.aws_ami.tf_ami_ubuntu.id
  key_name               = var.key_pair_name
  security_groups        = var.security_groups
  vpc_security_group_ids = var.vpc_security_group_ids
  count                  = var.instance_count_and_tag_names.count
  instance_type          = var.architecture == "arm64" ? var.instance_type_arm64 : var.instance_type_x86_64
  tags = {
    "Name" = var.instance_count_and_tag_names.tag_names[count.index]
  }

  lifecycle {
    create_before_destroy = true
  }
}
