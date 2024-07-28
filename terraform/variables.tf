variable "region" {
  type        = string
  default     = "us-east-1"
  description = "lambda region"
}

variable "lambda_role_name" {
  type        = string
  default     = "Spacelift_Test_Lambda_Function_Role"
  description = "lambda role name"
}

variable "lambda_policy_name" {
  type        = string
  default     = "aws_iam_policy_for_terraform_aws_lambda_role"
  description = "lambda policy name"
}

variable "lambda_name" {
  type        = string
  default     = "users_get_lambda"
  description = "lambda name"
}

variable "s3_bucket_layer_name" {
  type        = string
  default     = "layers-bucket-test"
  description = "layers bucket name"
}

variable "layer_compatible_runtimes" {
  default     = ["python3.10"]
  description = "layer compatible runtimes"
}


variable "lambda_for_vpc_name" {
  type        = string
  default     = "lambda_for_vpc_name"
  description = "lambda for access vpc name"
}
