locals {
  layer_zip_path    = "layer.zip"
  layer_name        = "my_lambda_requirements_layer"
  requirements_path = "../requirements.txt"
}

resource "null_resource" "lambda_layer" {
  triggers = {
    requirements = filesha1(local.requirements_path)
  }
  provisioner "local-exec" {
    command = <<EOT
      sudo rm -rf python
      mkdir python
      pip install --upgrade  -r ${local.requirements_path} -t python/
      zip -r ${local.layer_zip_path} python/
    EOT
  }
}

resource "aws_s3_bucket" "lambda_layer_bucket" {
  bucket = var.s3_bucket_layer_name
}

resource "aws_s3_object" "lambda_layer_zip" {
  bucket     = aws_s3_bucket.lambda_layer_bucket.id
  key        = "lambda_layers/${local.layer_name}/${local.layer_zip_path}"
  source     = local.layer_zip_path
  depends_on = [null_resource.lambda_layer] # triggered only if the zip file is created
}

resource "aws_lambda_layer_version" "my-lambda-layer" {
  s3_bucket           = aws_s3_bucket.lambda_layer_bucket.id
  s3_key              = aws_s3_object.lambda_layer_zip.key
  layer_name          = local.layer_name
  compatible_runtimes = [var.python_runtime]
  skip_destroy        = true
  depends_on          = [aws_s3_object.lambda_layer_zip]
}
