resource "aws_instance" "file_provisioner_ec2" {
    ami  ="ami-0220d79f3f480ecf5"
    vpc_security_group_ids = ["sg-088bbd993cbc52b59"]
    instance_type = "t3.micro"
    connection {
      type     = "ssh"
      user     ="ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }
    provisioner "file" {
      source = "readme.md"
      destination = "/tmp/readme.md"      
    }
    provisioner "file" {
      content  = "This is test content from local filesystem"
      destination = "/tmp/content.md"
    }
    tags = {
      Name ="file provisioners - ec2 instance"
    }

  }
 