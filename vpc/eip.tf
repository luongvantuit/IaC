resource "aws_eip" "tf_eip" {
  vpc      = true
  count    = length(var.ec2_instance_ids)
  instance = var.ec2_instance_ids[count.index]
}
