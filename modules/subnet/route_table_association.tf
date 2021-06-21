resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = var.route_table_id
}
