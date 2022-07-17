resource "local_sensitive_file" "save_password_rds" {
  filename = "${path.cwd}/password_${var.rds_info.identifier}.txt"
  content  = random_password.random_password.result
}
