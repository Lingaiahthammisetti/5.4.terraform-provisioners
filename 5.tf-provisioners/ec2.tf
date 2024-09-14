# #Example-1
# resource "aws_instance" "workspace" {
#   ami           = "ami-041e2ea9402c46c32"
#   vpc_security_group_ids = ["sg-0b8c28fdd8f99cc89"]
#   instance_type = "t3.micro"
  
#    provisioner "local-exec" {
#     command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
#   }
#    tags = {
#     Name = "Terraform Provisioner - EC2" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
#   }
# }
# #Example-2
# resource "aws_instance" "local-exec-provisioner" {
#   ami           = "ami-041e2ea9402c46c32"
#   vpc_security_group_ids = ["sg-0b8c28fdd8f99cc89"]
#   instance_type = "t3.micro"
  
#   #provisioners will run when you are creating resource. 
#   #They will not run once the resources are created.
#    provisioner "local-exec" {
#     command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
#   }
#    provisioner "local-exec" {
#     command = "ansible-playbook -i private_ips.txt web.yaml" #self is aws_instance.web
#   }
#     tags = {
#     Name = "Local-exec Provisioner - EC2" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
#   }
# }
#Note: This will not work here. For this, First we need to create ec2-instance and install terraform, ansible then clone the code, run it. Then you can try it again.

#Example-3
resource "aws_instance" "tf-provisioner_ec2" {
  ami           = "ami-09c813fb71547fc4f" 
  vpc_security_group_ids = ["sg-0ccccafe3d4f0719e"]
  instance_type = "t3.micro"
  
  #provisioners will run when you are creating resource. 
  #They will not run once the resources are created.
   provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt" #self is aws_instance.web
  }

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
   tags = {
    Name = "Terraform Provisioner - EC2" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
  }
}
