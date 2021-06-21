resource "aws_security_group" "default" {
  name = var.name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress_ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = var.cidr_blocks
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "ingress_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = var.cidr_blocks
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "ingress_https" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = var.cidr_blocks
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "ingress_mysql" {
  type = "ingress"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  cidr_blocks = var.cidr_blocks
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "ingress_self" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  self = true
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}