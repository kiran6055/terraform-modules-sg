resource "aws_security_group" "main" {
  name = var.security_group_name
  description = var.security_group_DES
  vpc_id      = var.vpc_id

  egress { # traffic going out of RDS
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.tags,
    var.security_group_tags,
    {"Name" = var.security_group_name}
  )
}

# this resource will add ingress rule to the securoty group
resource "aws_security_group_rule" "ingress_with_cidr" {
  count             = lenght(var.ingress_cidr)
  type              = "ingress"
  from_port         = lookup(var.ingress_cidr[count.index], "from_port")
  to_port           = lookup(var.ingress_cidr[count.index], "to_port")
  protocol          = "6" # this is for custom TCP
  cidr_blocks       = [lookup(var.ingress_cidr[count.index], "cidr_blocks")]
  description       = lookup(var.ingress_cidr[count.index], "description")
  security_group_id = aws_security_group.timing.id
}