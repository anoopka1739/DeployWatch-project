resource "aws_eks_cluster" "eks_cluster" {
  name     = var.project_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_cluster_version

  vpc_config {
    subnet_ids = [
      aws_subnet.eks_private_subnet[0].id,
      aws_subnet.eks_private_subnet[1].id
    ]

    security_group_ids = [
      aws_security_group.eks_cluster_sg.id
    ]

    endpoint_private_access = true
    endpoint_public_access  = false
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-cluster"
  })

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}