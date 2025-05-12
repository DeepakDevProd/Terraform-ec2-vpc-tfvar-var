# Provider variables
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "default"
}

# VPC
variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
}

# EC2 instance
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "jenkins" {
  description = "Existing AWS EC2 Key Pair name"
  type        = string
}

variable "allowed_ip_blocks" {
  description = "CIDR blocks allowed to SSH"
  type        = list(string)
}

variable "instance_name" {
  description = "EC2 instance name tag"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
}
