resource "aws_instance" "tf_ubuntu_instance" {
  ami                    = data.aws_ami.tf_ami_ubuntu.id
  key_name               = var.key_pair_name
  security_groups        = var.security_groups
  vpc_security_group_ids = var.vpc_security_group_ids
  count                  = var.instance_define.quantity
  tags = {
    "Name" = var.instance_define.tag_names[count.index]
  }
}
