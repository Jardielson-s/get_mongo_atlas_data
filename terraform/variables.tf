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

variable "mongo_uri" {
  type        = string
  default     = "mongodb+srv://[user]:[password]@cluster0.gqe6d.mongodb.net/?retryWrites=true&w=majority&appName=[cluster]"
  description = "mongo uri"
}

variable "database_name" {
  type        = string
  default     = "test"
  description = "database name"
}

variable "python_runtime" {
  type        = string
  default     = "python3.10"
  description = "python runtime"
}

variable "lambda_timeout" {
  type        = number
  default     = 120
  description = "lambda timeout"
}

variable "vpc_name" {
  type        = number
  default     = 120
  description = "lambda timeout"
}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr block"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}



variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "security_group_name" {
  type        = string
  default     = "vpc-peering-sg"
  description = "vpc peering sg"
}

variable "bucket_name" {
  type    = string
  default = "teste-bucket-lambda-01"
}
