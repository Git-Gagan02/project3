# Creating 1st web subnet
resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = "192.168.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "Web Subnet 1"
  }

}

# Creating 2nd web subnet
resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = "192.168.20.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    Name = "Web Subnet 2"
  }

}

#Creating 1st private subnet
resource "aws_subnet" "private-subnet-1a" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = "192.168.30.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"
  tags = {
    Name = "Database subnet 1"
  }

}

#Creating 2nd private subnet
resource "aws_subnet" "private-subnet-1b" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = "192.168.40.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"
  tags = {
    Name = "Database subnet 2"
  }
}
