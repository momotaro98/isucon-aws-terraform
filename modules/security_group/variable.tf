variable "name" {}
variable "vpc_id" {}
variable "cidr_blocks" {
  type = list(string)
}
