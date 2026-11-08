
resource "aws_security_group" "eks_cluster_sg" {
  name        = "${var.project_name}-eks-cluster-sg"
  description = "Custom security group for EKS control plane"
  vpc_id      = aws_vpc.eks-vpc.id

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-cluster-sg"
  })
}

resource "aws_security_group" "eks_node_sg" {
  name        = "${var.project_name}-eks-node-sg"
  description = "Custom security group for EKS worker nodes"
  vpc_id      = aws_vpc.eks-vpc.id

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-node-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "bastion_to_eks" {
  security_group_id            = aws_security_group.eks_cluster_sg.id
  referenced_security_group_id = aws_security_group.bastion_sg.id

  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443

  description = "Allow bastion to access Kubernetes API"
}

resource "aws_vpc_security_group_ingress_rule" "nodes_to_eks" {
  security_group_id            = aws_security_group.eks_cluster_sg.id
  referenced_security_group_id = aws_security_group.eks_node_sg.id

  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443

  description = "Allow worker nodes to access Kubernetes API"
}


resource "aws_vpc_security_group_ingress_rule" "eks_to_nodes" {
  security_group_id            = aws_security_group.eks_node_sg.id
  referenced_security_group_id = aws_security_group.eks_cluster_sg.id

  ip_protocol = "tcp"
  from_port   = 10250
  to_port     = 10250

  description = "Allow control plane to access kubelet"
}

resource "aws_vpc_security_group_ingress_rule" "node_to_node" {
  security_group_id            = aws_security_group.eks_node_sg.id
  referenced_security_group_id = aws_security_group.eks_node_sg.id

  ip_protocol = "-1"

  description = "Allow all traffic between worker nodes"
}
