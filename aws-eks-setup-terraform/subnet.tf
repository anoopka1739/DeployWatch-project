resource "aws_subnet" "eks_public_subnet" {
  count                   = length(var.eks_public_subnets_cidrs)
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = var.eks_public_subnets_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name                                        = "${var.project_name}-eks-public-subnet-${count.index + 1}"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  })

}

resource "aws_subnet" "eks_private_subnet" {
  count                   = length(var.eks_private_subnets_cidr)
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = var.eks_private_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name                                        = "${var.project_name}-eks-private-subnet-${count.index + 1}"
    "kubernetes.io/cluster/${var.project_name}" = "owned"
    "kubernetes.io/role/node"                   = "1"
    "kubernetes.io/role/internal-elb"           = "1"
  })
}