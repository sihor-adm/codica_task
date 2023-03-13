resource "aws_instance" "webserver" {
ami = "ami-0d1ddd83282187d18"
instance_type = "t2.micro"
subnet_id = aws_subnet.private1.id
vpc_security_group_ids = aws_security_group.main-sg.id
key_name = "codica"

tags = {
   Name = "Webserver_From_Terraform"
  }
}