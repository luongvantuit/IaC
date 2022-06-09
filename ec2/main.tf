resource "aws_instance" "tf_aws_ec2_instance" {
  ami      = data.aws_ami.tf_aws_ami.id
  key_name = var.key_pair_name
}
