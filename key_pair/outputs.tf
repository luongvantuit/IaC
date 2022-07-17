output "key_pair_name" {
  value = aws_key_pair.key_pair.key_name
}

output "private_key" {
  value     = tls_private_key.tls_private_key.private_key_pem
  sensitive = true
}
