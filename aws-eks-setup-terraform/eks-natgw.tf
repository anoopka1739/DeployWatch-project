
resource "aws_nat_gateway" "eks-nat-gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.eks_public_subnet[0].id

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-nat"
  })

  depends_on = [
    aws_internet_gateway.eks-igw,
    aws_route_table_association.eks-public-route-table-association
  ]
}
