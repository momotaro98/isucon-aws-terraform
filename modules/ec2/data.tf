data "aws_ami" "standalone_ami" {
  most_recent      = true
  owners           = [var.standalone_ami_owner]

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = [format("%s-*", var.standalone_ami_name)]
  }
}