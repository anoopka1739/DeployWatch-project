
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "${var.project_name}-bastion-profile"
  role = aws_iam_role.bastion_role.name

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-bastion-profile"
  })
}
