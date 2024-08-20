# Example-1
# resource "aws_instance" "workspace" {
#   ami           = "ami-041e2ea9402c46c32"
#   vpc_security_group_ids = ["sg-0b35c64f66b53871f"]
#   instance_type = "t3.micro"
  
#    provisioner "local-exec" {
#     command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
#   }
# }

# #Example-2
# resource "aws_instance" "workspace" {
#   ami           = "ami-041e2ea9402c46c32"
#   vpc_security_group_ids = ["sg-0b35c64f66b53871f"]
#   instance_type = "t3.micro"
  
#   #provisioners will run when you are creating resource. 
#   #They will not run once the resources are created.
#    provisioner "local-exec" {
#     command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
#   }
    
#    provisioner "local-exec" {
#     command = "ansible-playbook -i private_ips.txt web.yaml" #self is aws_instance.web
#   }
# }

#Example-3
resource "aws_instance" "workspace" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-0b35c64f66b53871f"]
  instance_type = "t3.micro"
  
  #provisioners will run when you are creating resource. 
  #They will not run once the resources are created.
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
  }
    
  #  provisioner "local-exec" {
  #   command = "ansible-playbook -i private_ips.txt web.yaml" #self is aws_instance.web
  # }

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
}
