resource "aws_instance" "web" {
  ami = "ami-090252cbe067a9e58"
  instance_type = "t3.micro"
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx",
      "sudo pip install ansible"
    ]
  }
}
