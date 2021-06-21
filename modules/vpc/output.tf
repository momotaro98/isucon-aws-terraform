output "vpc_id" {
  value = aws_vpc.isucon.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}
