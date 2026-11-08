# resource "aws_security_group" "eks_cluster_sg" {
#   name        = "${var.project_name}-eks-cluster-sg"
#   description = "EKS Cluster Security Group"
#   vpc_id      = aws_vpc.eks-vpc.id

#     ingress {
#         description = "Allow all traffic from bastion security group"
#         from_port   = 443
#         to_port     = 443
#         protocol    = "tcp"
#         security_groups = [aws_security_group.bastion_sg.id]
#     }
#     ingress {
#         description = "Allow all traffic from worker nodes security group"
#         from_port   = 10250
#         to_port     = 10250
#         protocol    = "tcp"
#         security_groups = [aws_security_group.eks_worker_node_sg.id]
#     }
#     egress {
#         description = "Allow all outbound traffic"
#         from_port   = 0
#         to_port     = 0
#         protocol    = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     tags = merge(local.common_tags, {
#         Name = "${var.project_name}-eks-cluster-sg"
#     })  

# }