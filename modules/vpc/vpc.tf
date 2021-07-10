resource "aws_vpc" "isucon" {
  cidr_block = format("%s/16", var.vpc_net_mask)
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "isucon"
  }
}
