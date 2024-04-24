resource "aws_instance" "web" {
  ami = "ami-090252cbe067a9e58"
  instance_type = "t3.micro"

}
resource "null_resource" "demo" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.web.public_ip
    }
    inline = [
      " dnf install nginx -y"

    ]
  }
}

