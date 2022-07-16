resource "local_sensitive_file" "tf_save_password_rds" {
  filename = "${path.cwd}/password_${var.tf_rds_info.name}.txt"
  content  = random_password.tf_random_password.result
}
