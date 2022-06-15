resource "aws_cognito_user_pool" "tf_cognito_user_pool" {
  name = var.cognito_name
}
