#Creating 1st Ec2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
    ami = "ami-06489866022e12a14"
    instance_type = "t2.micro"
    key_name = "tests"
    vpc_security_group_ids = ["${aws_security_group.demosg.id}"]
    subnet_id = "${aws_subnet.public-subnet-1a.id}" 
    aassociate_public_ip_address =true 
    user_data ="${file(candycrush.sh)}"
    tags = {
      Name = "My Public Instance 1"
    }
}

#Creating 2nd Ec2 instance in Public Subnet
resource "aws_instance" "demoinstance2" {
    ami = "ami-06489866022e12a14"
    instance_type = "t2.micro"
    key_name = "tests"
    vpc_security_group_ids = ["${aws_security_group.demosg.id}"]
    subnet_id = "${aws_subnet.public-subnet-1b.id}"
    aassociate_public_ip_address =true
    user_data = "${file(fooddata.sh)}"
    tags = {
      Name = "My Public Instance 2"
    }
}
