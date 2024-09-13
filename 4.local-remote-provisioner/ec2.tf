resource "aws_instance" "remote-exec-provisioner-ec2" {
 ami           = "ami-09c813fb71547fc4f" 
  vpc_security_group_ids = ["sg-0ccccafe3d4f0719e"]
  instance_type = "t3.micro"
  
  #provisioners will run when you are creating resource. 
  #They will not run once the resources are created.
  #  provisioner "local-exec" {
  #   command = "echo ${self.private_ip} >> private_ips.txt" #self is aws_instance.web
  # }
    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  
  #  provisioner "remote-exec" {
  #   inline = [
  #     "sudo dnf install ansible -y",
  #     "sudo dnf install nginx -y",
  #     "sudo systemctl start nginx",
  #   ]
  # }
     provisioner "file" {
          source       = "mysql.sh"
          destination  = "/tmp/install_mysql.sh"
      }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install_mysql.sh",
            "sudo sh /tmp/install_mysql.sh"
        ]
    }

   tags = {
    Name = "Local-Remote-provisioner-EC2" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
  }
}
