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
  subnet_id     = data.terraform_remote_state.network.outputs.subnet_id
}

output "subnet_id" {
  value = aws_subnet.main.id
  description = "The ID of the subnet used by the application."
}
