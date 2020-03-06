provider "aws" {
  region = "eu-west-1"
}

module "demo" {
  source = "../../modules/demo"
  cidr_block = "10.0.0.0/16"
}