resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eks-natgw-eip"
  })
}
