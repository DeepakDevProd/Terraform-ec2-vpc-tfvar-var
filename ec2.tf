# resource "aws_key_pair" "web_key" {
#   key_name   = var.key_name
#   public_key = file(var.public_key_path)
# }

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_blocks
  }

  ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg"
  }
}

resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name               = var.key_name

user_data = <<-EOF
  #!/bin/bash
  apt-get update -y
  apt-get install nginx -y
  cat <<EOM > /var/www/html/index.html
  <!DOCTYPE html>
  <html>
  <head>
      <title>My Terraform EC2</title>
      <style>
          body { background-color: #222; color: #eee; font-family: sans-serif; text-align: center; padding-top: 50px; }
          h1 { color: #00ff99; }
      </style>
  </head>
  <body>
      <h1>🚀 Terraform EC2 is Live!</h1>
      <p>This page is served by Nginx on an EC2 instance provisioned with Terraform.</p>
  </body>
  </html>
  EOM
  systemctl restart nginx
EOF



  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}
