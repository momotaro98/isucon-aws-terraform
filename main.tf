terraform {
  required_version = ">= 0.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.24.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  region = "ap-northeast-1"
  alias  = "ap_northeast"
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source         = "./modules/subnet"
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
}

module "sg" {
  source      = "./modules/security_group"
  name        = "isucon_sg"
  vpc_id      = module.vpc.vpc_id
  cidr_blocks = split(",", var.access_cidr_blocks)
}

module "participant-ec2" {
  source               = "./modules/ec2"
  standalone_ami_name  = var.standalone_ami_name
  standalone_ami_owner = var.standalone_ami_owner
  subnet_id            = module.subnet.subnet_id
  security_group_id    = module.sg.security_group_id
  ec2_members          = var.ec2_members
}
