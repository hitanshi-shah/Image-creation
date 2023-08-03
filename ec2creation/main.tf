terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5NYXBXZD4V23HCNF"
  secret_key = "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"
}

# data "aws_security_group" "selected" {
#   id = var.security_group_id[0]
# }

# data "aws_subnet" "selected" {
#   id = var.subnet_id[0]
# }

# data "aws_key_pair" "example" {
#   key_name           = var.key_pair
#   include_public_key = true

# }

data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    #values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    values = ["Windows_Server-2016-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["922929446471"] # Canonical
}

output "ami_id"{
 value = data.aws_ami.windows.id
}

resource "aws_instance" "webcom" {
  ami           = data.aws_ami.windows.id
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  security_groups = "${var.security_group_id}"
  key_name = var.key_pair

  tags = {
    Name = "HelloWorld"
  }
}

output "theId" {
  value = aws_instance.webcom.id
}
