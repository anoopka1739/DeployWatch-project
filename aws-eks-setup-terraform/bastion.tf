resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.bastion_instance_type
  subnet_id     = aws_subnet.eks_public_subnet[0].id
  key_name      = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.bastion_profile.name

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-bastion"
  })

}