# Create EC2 Remote Config EC2 Private In VPC Block
resource "aws_eip" "eip_ec2_remote" {
  vpc      = true
  instance = aws_instance.instance_remote.id
}

resource "aws_instance" "instance_remote" {
  ami                    = data.aws_ami.ami_ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.sg.ec2_sg.id]
  subnet_id              = module.vpc.subnet_public_ids[0]
  key_name               = module.key_pair.key_pair_name
  tags = {
    "Name" = "EC2 Remote"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update"
    ]
    connection {
      host        = self.public_ip
      type        = "ssh"
      private_key = module.key_pair.private_key
      user        = "ubuntu"
    }
  }
}
