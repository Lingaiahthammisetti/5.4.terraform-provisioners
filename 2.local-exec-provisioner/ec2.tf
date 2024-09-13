#Example-1
resource "aws_instance" "local-exec-provisioner-ec2" {
  ami           = "ami-09c813fb71547fc4f" 
  vpc_security_group_ids = ["sg-0ccccafe3d4f0719e"]
  instance_type = "t3.micro"
  
  #self is aws_instance.web
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
    #command =  echo 'Instance is created.' "
    #command = "yum install ansible -y" --> it not working here.
  }
  #   provisioner "local-exec" {
  #   command = "echo testing > /tmp/test.txt"
  # }
  # provisioner "local-exec" {
  #   working_dir = "/tmp"
  #   command = "echo ${self.public_ip}>myip.txt"
  # }
  # provisioner "local-exec" {
  #   interpreter = [
  #     "/usr/bin/python3", "-c"
  #   ]
  #   command = "print('HelloWorld')"
  # }
  # provisioner "local-exec" {
  #   command = "env>env.txt"
  #   environment = {
  #     envname = "envvalue"
  #   }
  # }
   tags = {
    Name = "local-exec-provisioner-EC2" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
  }
}
