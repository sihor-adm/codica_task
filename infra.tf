provider "aws" {
  region = "eu-central-1"
}
# Create EC2 instance
#resource "aws_instance" "Ubuntu" {
 # ami           = "ami-0557a15b87f6559cf"
  #instance_type = "t3.micro"

#  tags = {
 #   Name    = "wp"
  #  Owner   = "Ihor Savchak"
   # Project = "Codica test"
  #}
#}

# Create a VPC with subnets
resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "public-subnet-2"
  }
}
