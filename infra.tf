provider "aws" {
region = "eu-central-1"
}
resource "aws_instance" "Ubuntu" {
  ami           = "ami-0557a15b87f6559cf"
          instance_type = "t3.micro"

  tags = {
    Name    = "wp"
    Owner   = "Ihor Savchak"
    Project = "Codica test"
  }
} 