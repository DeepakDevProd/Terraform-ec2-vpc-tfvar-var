aws_region        = "eu-west-2"
aws_profile       = "default"

vpc_cidr          = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"

instance_type     = "t2.micro"
ami_id            = "ami-0a94c8e4ca2674d5a"  # Replace as needed
key_name          = "jenkins"
# public_key_path   = "~/.ssh/id_rsa.pub"
allowed_ip_blocks = ["0.0.0.0/0"]
instance_name     = "realtime-ec2"
environment       = "production"
