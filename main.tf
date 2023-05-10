#this file consists of code for instances and sg
provider "aws" {
region = "us-east-1"
access_key =  "AKIAZW3CTBA4EASF75VY"
secret_key = "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"
}


resource "aws_instance" "one" {
  ami             = "ami-03c7d01cf4dedc891"
  instance_type   = "t2.micro"
  key_name        = "surya"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "ap-south-1a"
    tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "two" {
  ami             = "ami-03c7d01cf4dedc891"
  instance_type   = "t2.micro"
  key_name        = "surya"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "ap-south-1b"
    tags = {
    Name = "web-server-2"
  }
}


resource "aws_security_group" "three" {
  name = "elb-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
