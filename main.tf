provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "knjoroge-org"
    workspaces = {
      name = "aws-0-network"
    }
  }
}

resource "aws_instance" "app" {
  ami           = "ami-0ae8f15ae66fe8cda"
  instance_type = "t2.micro"
}
