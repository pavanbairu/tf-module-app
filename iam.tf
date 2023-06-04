#resource "aws_iam_role_policy" "ssm-ps-policy" {
#  name = "${var.name}-${var.env}-ssm-ps-policy"
#  role = aws_iam_role.role.id
#
#
#  policy = jsonencode({
#    "Version" : "2012-10-17",
#    "Statement" : [
#      {
#        "Sid" : "VisualEditor0",
#        "Effect" : "Allow",
#        "Action" : [
#          "kms:Decrypt",
#          "ssm:GetParameterHistory",
#          "ssm:GetParametersByPath",
#          "ssm:GetParameters",
#          "ssm:GetParameter"
#        ],
#        "Resource" : concat([var.kms_arn], local.resources)
#      }
#    ]
#  })
#}
