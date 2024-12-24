
resource "aws_instance" "file_provisioner_ec2" {
  
  ami           = "ami-09c813fb71547fc4f" 
  vpc_security_group_ids = ["sg-06b1b57b365846051"]
  instance_type = "t3.micro"
 
  connection {
    type        = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host        = self.public_ip
  }
  # file, local-exec, remote-exec
  provisioner "file" {
    source      = "readme.md"      # terraform machine
    destination = "/tmp/readme.md" # remote machine
  }
  provisioner "file" {
    content     = "this is test content from local filesystem" # terraform machine
    destination = "/tmp/content.md"      # remote machine
  }
  #provisioners will run when you are creating resource. 
  #They will not run once the resources are created.
   provisioner "file" { # copying file from local to remote machine
    source     = "shell.sh" # terraform machine
    destination = "/tmp/shell.sh"   # remote machine
  }
   provisioner "file" {  # copying directory from local to remote machine
    source    = "project" # terraform machine
    destination = "/home/ec2-user"   # remote machine
  }

   tags = {
    Name = "File Provisioner-EC2" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
  }
}

