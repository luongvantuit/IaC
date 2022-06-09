output "tf_ubuntu_instance_public_ips" {
  value = [for i in aws_instance.tf_ubuntu_instance : i.public_ip]
}
