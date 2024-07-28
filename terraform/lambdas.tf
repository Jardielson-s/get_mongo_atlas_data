data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "../"
  output_path = "../lambda.zip"
  excludes    = ["lambda.zip", "environment", ".gitignore", ".env", "README.md", ".git", "requirements.txt", "terraform"]
}


resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = "../lambda.zip"
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "src/module/users/lambda/lambda_handler.lambda_handler"
  runtime       = "python3.9"
  timeout       = 120
  layers        = [aws_lambda_layer_version.my-lambda-layer.arn]
  environment {
    variables = {
      MONGO_URI = "mongodb+srv://jardielson:test*31415@cluster0.gqe6d.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
    }
  }
  depends_on = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role, aws_lambda_layer_version.my-lambda-layer]
}
