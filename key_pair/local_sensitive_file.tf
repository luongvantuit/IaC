resource "local_sensitive_file" "tf_local_sensitive_file" {
  file_permission = "600"
  filename        = "${path.cwd}/${var.key_pair_name}.pem"
  content         = tls_private_key.tf_tls_private_key.private_key_pem
}
