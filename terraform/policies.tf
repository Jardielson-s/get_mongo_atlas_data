

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = var.lambda_policy_name
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   },
   {
     "Action": [
       "s3:PutObject"
     ],
     "Resource": "arn:aws:s3:::${var.bucket_name}/*.json",
     "Effect": "Allow"
   },
   {
     "Effect": "Allow",
     "Action": [
       "ec2:CreateNetworkInterface",
       "ec2:DeleteNetworkInterface",
       "ec2:DescribeNetworkInterfaces"
     ],
     "Resource": "*"
   }
 ]
}
EOF
}
