provider "aws" {
  region  = "us-east-1"
}

provider "random" {}

resource "random_string" "random" {
  length    = 8
  special   = false
  min_lower = 8
}

resource "aws_instance" "example" {
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  tags = {
    Name = "testing-strato-${random_string.random.result}"
  }

  key_name ="qa-product"
}
