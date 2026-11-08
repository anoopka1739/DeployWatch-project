# Allow the bastion IAM role to authenticate with EKS
resource "aws_eks_access_entry" "bastion_access" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  principal_arn = aws_iam_role.bastion_role.arn
  type          = "STANDARD"
}

# Grant the bastion role Kubernetes cluster administrator permissions
resource "aws_eks_access_policy_association" "bastion_admin" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  principal_arn = aws_iam_role.bastion_role.arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [
    aws_eks_access_entry.bastion_access
  ]
}

# Allow AWS Console IAM user to authenticate with EKS
# resource "aws_eks_access_entry" "console_admin_access" {
#   cluster_name  = aws_eks_cluster.eks_cluster.name
#   principal_arn = "arn:aws:iam::211125422490:user/admin"
#   type          = "STANDARD"
# }

# # Grant read-only Kubernetes access
# resource "aws_eks_access_policy_association" "console_view_access" {
#   cluster_name  = aws_eks_cluster.eks_cluster.name
#   principal_arn = aws_eks_access_entry.console_admin_access.principal_arn

#   policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

#   access_scope {
#     type = "cluster"
#   }
# }