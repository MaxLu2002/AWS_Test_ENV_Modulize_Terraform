resource "aws_security_group" "private_sg" {
  count       = var.vpc_count
  vpc_id      = var.vpc_id[count.index]
  name        = "${var.tags["Name"]}-private-sg"
  description = "Allow traffic from public SG"

  tags = merge(var.tags, {
    Name = "${var.tags.Name}-private-sg"
  })
}

resource "aws_security_group_rule" "allow_from_public" {
  count                    = var.vpc_count
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.public_sg[count.index].id
  security_group_id        = aws_security_group.private_sg[count.index].id
}
