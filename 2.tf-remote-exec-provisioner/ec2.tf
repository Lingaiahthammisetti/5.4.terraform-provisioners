resource "aws_instance" "remote_exec_ec2" {
    ami  ="ami-0220d79f3f480ecf5"
    vpc_security_group_ids = ["sg-088bbd993cbc52b59"]
    instance_type = "t3.micro"
    # provisioner "local-exec" {
    #   command = "echo ${self.private_ip} >> private_ips.txt"
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
          "sudo systemctl start nginx"
         ]
    }
    tags = {
      Name ="remote-exec ec2 instance"
    }

  }
 