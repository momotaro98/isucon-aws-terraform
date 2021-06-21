resource "aws_subnet" "public" {
  vpc_id = var.vpc_id
  cidr_block = "10.1.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"
}
