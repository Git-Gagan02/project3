#Creating 1st Ec2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  ami                         = "ami-026b57f3c383c2eec"
  instance_type               = "t2.micro"
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = aws_subnet.public-subnet-1a.id
  associate_public_ip_address = true
  user_data                   = file("candycrush.sh")
  tags = {
    Name = "Candycrush"
  }
}

#Creating 2nd Ec2 instance in Public Subnet
resource "aws_instance" "demoinstance2" {
  ami                         = "ami-026b57f3c383c2eec"
  instance_type               = "t2.micro"
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = aws_subnet.public-subnet-1b.id
  associate_public_ip_address = true
  user_data                   = file("fooddata.sh")
  tags = {
    Name = "Foodcourt"
  }
}
