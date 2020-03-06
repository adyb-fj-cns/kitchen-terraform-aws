provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
}

resource "aws_vpc" "demo" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.name
  }
}