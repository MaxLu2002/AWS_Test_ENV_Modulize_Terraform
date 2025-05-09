

resource "aws_instance" "private_instances" {
  count                = var.private_subnet_count * var.ec2_count * var.vpc_count
  ami                  = data.aws_ssm_parameter.ami.value
  instance_type        = var.instance_type
  subnet_id            = element(var.private_subnet_id, count.index)
  security_groups      = [element(aws_security_group.private_sg.*.id, floor(count.index / (var.public_subnet_count * var.ec2_count)))]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = merge(var.tags, {
    Name = "${var.tags.Name}-private-${count.index + 1}"
  })
}
