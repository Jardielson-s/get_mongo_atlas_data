

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

# resource "aws_iam_policy" "iam_policy_for_lambda_for_vpc" {
#   name   = var.lambda_for_vpc_name
#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [ 
#                  "ec2:CreateNetworkInterface",
#                  "ec2:DeleteNetworkInterface",
#                  "ec2:DescribeNetworkInterfaces",
#             ],
#             "Resource": [ "*" ]
#         }
#     ]
# }
# EOF
# }
