resource "aws_route_table_association" "eks-public-route-table-association" {
  count          = length(aws_subnet.eks_public_subnet)
  subnet_id      = aws_subnet.eks_public_subnet[count.index].id
  route_table_id = aws_route_table.eks-public-route-table.id
}

resource "aws_route_table_association" "eks-private-route-table-association" {
  count          = length(aws_subnet.eks_private_subnet)
  subnet_id      = aws_subnet.eks_private_subnet[count.index].id
  route_table_id = aws_route_table.eks-private-route-table.id
}
