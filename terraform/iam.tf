resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
  depends_on = [aws_iam_role.lambda_role, aws_iam_policy.iam_policy_for_lambda]
}
