
# resource "aws_security_group" "eks_worker_node_sg" {
#   name        = "${var.project_name}-eks-node-sg"
#   description = "Security group for EKS worker nodes"
#   vpc_id      = aws_vpc.eks-vpc.id

#   ingress {
#     description = "Allow communication between worker nodes"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     self        = true
#   }

#   ingress {
#     description     = "Allow control plane to communicate with kubelet"
#     from_port       = 10250
#     to_port         = 10250
#     protocol        = "tcp"
#     security_groups = [aws_security_group.eks_cluster_sg.id]
#   }

#   ingress {
#     description     = "Allow worker nodes to access Kubernetes API"
#     from_port       = 443
#     to_port         = 443
#     protocol        = "tcp"
#     security_groups = [aws_security_group.eks_cluster_sg.id]
#   }

#   egress {
#     description = "Allow outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = merge(local.common_tags, {
#     Name = "${var.project_name}-eks-node-sg"
#   })
# }
