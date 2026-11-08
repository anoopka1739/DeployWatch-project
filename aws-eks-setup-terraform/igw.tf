resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-igw"
  })
}
