output "instance_ips" {
  value = [for i in aws_instance.instances : i.public_ip]
}

output "instance_ids" {
  value = [for i in aws_instance.instances : i.id]
}

output "instance_private_ips" {
  value = [for i in aws_instance.instances : i.private_ip]
}
