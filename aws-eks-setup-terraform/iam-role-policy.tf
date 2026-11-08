
resource "aws_iam_role_policy" "bastion_eks_policy" {
  name = "${var.project_name}-bastion-eks-policy"
  role = aws_iam_role.bastion_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "eks:DescribeCluster"
        ]

        Resource = "*"
      }
    ]
  })
}
