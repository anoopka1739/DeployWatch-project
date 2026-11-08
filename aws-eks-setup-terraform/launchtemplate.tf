resource "aws_launch_template" "eks_node_template" {
  name_prefix = "${var.project_name}-eks-node-"

  vpc_security_group_ids = [
    aws_security_group.eks_node_sg.id
  ]

  tag_specifications {
    resource_type = "instance"

    tags = merge(local.common_tags, {
      Name = "${var.project_name}-worker-node"
    })
  }
}