resource "aws_instance" "web" {
  ami = "ami-090252cbe067a9e58"
  instance_type = "t3.micro"
  instance_market_options {
    market_type = "spot"
    spot_options {
      spot_instance_type = "persistent"
      instance_interruption_behavior = "stop"
    }
  }
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
      "  sudo dnf install nginx -y"
    ]
  }
}

