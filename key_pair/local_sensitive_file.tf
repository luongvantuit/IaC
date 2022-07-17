resource "local_sensitive_file" "local_sensitive_file" {
  file_permission = "600"
  filename        = "${path.cwd}/${var.key_pair_name}.pem"
  content         = tls_private_key.tls_private_key.private_key_pem
}
