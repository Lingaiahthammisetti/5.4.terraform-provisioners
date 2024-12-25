#Example-1
resource "aws_instance" "local-exec-provisioner-ec2" {
  ami           = "ami-09c813fb71547fc4f" 
  vpc_security_group_ids = ["sg-06b1b57b365846051"]
  instance_type = "t3.micro"
  
  #self is aws_instance.web
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }
  # provisioner "local-exec" {
  #   echo "#!/bin/bash /n
  #   echo 'Hello, Terraform!' > /tmp/hello.txt" > script.sh
  #   chmod +x script.sh
  # }
  provisioner "local-exec" {
    command = "/bin/bash install_ansible.sh" 
  }


  provisioner "local-exec" {
    command = "ansible-playbook -i private_ips.txt web.yaml" #self is aws_instance.web
  }

   tags = {
    Name = "local-exec-shellscript" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
  }
}
