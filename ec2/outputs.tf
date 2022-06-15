output "tf_instance_public_ips" {
  value = [for i in aws_instance.tf_instances : i.public_ip]
}

output "tf_instance_ids" {
  value = [for i in aws_instance.tf_instances : i.id]
}
