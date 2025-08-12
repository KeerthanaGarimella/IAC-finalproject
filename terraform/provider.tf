provider "aws" {
  region     = var.aws_region
  # The following credentials are best set via environment variables for security:
  # AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN
  # Optionally, you can uncomment below to use variables (not recommended for production):
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  # token      = var.aws_session_token
}

# Local backend for state management
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}