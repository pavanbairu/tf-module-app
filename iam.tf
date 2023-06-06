resource "aws_iam_role" "role" {
  name = "${var.name}-${var.env}-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(var.tags, { Name = "${var.name}-${var.env}-role" })
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.name}-${var.env}-role"
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy" "role" {
  name = "${var.name}-${var.env}-ssm-ps-policy"
  role = aws_iam_role.role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "kms:Decrypt",
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter"
        ],
        "Resource" : concat([var.kms_arn], local.resources)
      }
      #      {
      #        "Sid": "VisualEditor1",
      #        "Effect": "Allow",
      #        "Action": "ssm:DescribeParameters",
      #        "Resource": "*"
      #      }
    ]
  })
}