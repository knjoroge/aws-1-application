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
  ami           = "ami-1234567890abcdef0"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.network.outputs.subnet_id
}
