provider "aws" {
 region = "us-east-1"
}
resource "aws_instance" "web" {
 ami = "ami-0a0e5d9c7acc336f1"
 instance_type = "t2.micro"
 key_name = "myserver"
 security_groups = [ "${aws_security_group.my-sg.name}"]
 
  tags = {
 Name = "terraform_project"
 }
}
resource "aws_security_group" "my-sg" {
  name = "myweb_sg"
 description = "to allow traffic"
 ingress {
from_port  = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks =["0.0.0.0/0"]
 }
}


