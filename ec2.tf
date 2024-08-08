
resource "aws_instance" "workspace" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-0b35c64f66b53871f"]
  instance_type = "t3.micro"
  
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
  }
}

