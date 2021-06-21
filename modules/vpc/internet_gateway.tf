resource "aws_internet_gateway" "isucon" {
  vpc_id = aws_vpc.isucon.id
}
