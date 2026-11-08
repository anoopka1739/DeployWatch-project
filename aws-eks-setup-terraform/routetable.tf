resource "aws_route_table" "eks-public-route-table" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-route-table"
  })
}

resource "aws_route_table" "eks-private-route-table" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-nat-gateway.id
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-private-route-table"
  })
}
