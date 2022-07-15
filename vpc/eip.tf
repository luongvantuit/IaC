resource "aws_eip" "tf_eip" {
  vpc = true
}

resource "aws_eip" "tf_eip_nat" {
  vpc = true
}
