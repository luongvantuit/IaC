resource "aws_instance" "tf_instances" {
  ami                    = var.tf_os == "linux" ? data.aws_ami.tf_ami_linux.id : data.aws_ami.tf_ami_ubuntu.id
  key_name               = var.tf_key_pair_name
  vpc_security_group_ids = var.tf_vpc_security_group_ids
  security_groups        = var.tf_security_groups
  count                  = var.tf_instance_count_and_tag_names.count
  instance_type          = var.tf_architecture == "arm64" ? var.tf_instance_type_arm64 : var.tf_instance_type_x86_64
  subnet_id              = var.tf_subnet_ids[count.index]
  tags = {
    "Name" = var.tf_instance_count_and_tag_names.tag_names[count.index]
  }

  lifecycle {
    create_before_destroy = true
  }
}
