resource "aws_instance" "web" {
  ami = "ami-090252cbe067a9e58"
  instance_type = "t3.micro"
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }
    inline = [
      "sudo dnf install nginx -y"

    ]
  }
}
