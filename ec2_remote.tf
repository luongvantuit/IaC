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
    scripts = [
      "${path.cwd}/scripts/update_control_node.sh",
      "${path.cwd}/scripts/install_ansible.sh",
      "${path.cwd}/scripts/create_folder_ansible.sh"
    ]

    connection {
      host        = self.public_ip
      type        = "ssh"
      private_key = module.key_pair.private_key
      user        = "ubuntu"
    }
  }

  provisioner "remote-exec" {
    inline = concat([
      "echo \"--- Copy playbook Ansible ---\"",
      "echo \"${file("${path.cwd}/ansible/playbook.yaml")}\" > \"$HOME/ansible/playbook.yaml\"",
      "echo \"--- Copy Key pem VPC ---\"",
      "[ ! -d $HOME/keys ] && mkdir -p $HOME/keys",
      "echo \"${file("${path.cwd}/${module.key_pair.key_pair_name}.pem")}\" > \"$HOME/keys/key_vpc.pem\"",
      "chmod 0400 $HOME/keys/key_vpc.pem",
      "echo \"--- Create known hosts ---\""
      ],
      [
        for ip in module.ec2.instance_private_ips : "ssh-keyscan -t rsa ${ip}"
      ],
      [
        for ip in module.ec2.instance_private_ips : "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --key-file \"$HOME/keys/key_vpc.pem\" -T 300 -i '${ip},', \"$HOME/ansible/playbook.yaml\""
    ])
    connection {
      host        = self.public_ip
      type        = "ssh"
      private_key = module.key_pair.private_key
      user        = "ubuntu"
    }
  }

}
