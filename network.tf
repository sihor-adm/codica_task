resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  depends_on = [
    aws_vpc.main
  ]

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
  depends_on = [
    aws_vpc.main
  ]

  tags = {
    Name = "private2"
  }
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-central-1a"
  depends_on = [
    aws_vpc.main
  ]

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "eu-central-1b"
  depends_on = [
    aws_vpc.main
  ]

  tags = {
    Name = "public2"
  }
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id
  depends_on = [
    aws_vpc.main,
    aws_subnet.public1,
    aws_subnet.public2
  ]
}

resource "aws_eip" "eip1" {
  vpc = true
}

resource "aws_eip" "eip2" {
  vpc = true
}

resource "aws_nat_gateway" "public1-nat-gw" {
  allocation_id     = aws_eip.eip1.id
  subnet_id         = aws_subnet.public1.id

  tags = {
    Name = "Public1 gw NAT"
  }

  depends_on = [aws_internet_gateway.main-igw]
}

resource "aws_nat_gateway" "public2-nat-gw" {
  allocation_id     = aws_eip.eip2.id
  subnet_id         = aws_subnet.public2.id

  tags = {
    Name = "Public2 gw NAT"
  }

  depends_on = [aws_internet_gateway.main-igw]
}
