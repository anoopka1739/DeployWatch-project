resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.project_name}-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    aws_subnet.eks_private_subnet[0].id,
    aws_subnet.eks_private_subnet[1].id
  ]

  instance_types = [var.eks_node_instance_type]
  capacity_type  = "ON_DEMAND"

  launch_template {
    id      = aws_launch_template.eks_node_template.id
    version = aws_launch_template.eks_node_template.latest_version
  }

  scaling_config {
    desired_size = 2
    min_size     = 2
    max_size     = 3
  }

  update_config {
    max_unavailable = 1
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-node-group"
  })

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_ecr_policy,
    aws_iam_role_policy_attachment.eks_cni_policy
  ]
}