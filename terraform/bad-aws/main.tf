provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_ebs_volume" "bad" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted         = false
}