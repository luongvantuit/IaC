resource "aws_key_pair" "tf_key_pair" {
  key_name   = var.tf_key_pair_name
  public_key = tls_private_key.tf_tls_private_key.public_key_openssh
}
