resource "aws_instance" "local_exec_ec2" {
    ami  ="ami-0220d79f3f480ecf5"
    vpc_security_group_ids = ["sg-088bbd993cbc52b59"]
    instance_type = "t3.micro"
    provisioner "local-exec" {
      command = "echo ${self.private_ip} >> private_ips.txt"
    }
    tags = {
      Name ="local-exec ec2 instance"
    }

  }
 