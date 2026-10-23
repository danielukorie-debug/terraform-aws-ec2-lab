variable "aws_region" {
  description = "AWS Region in which to deploy the EC2 lab."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the lab."
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair in the selected Region."
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Your approved public IPv4 address in CIDR notation, usually /32."
  type        = string

  validation {
    condition = (
      can(cidrnetmask(var.allowed_ssh_cidr)) &&
      var.allowed_ssh_cidr != "0.0.0.0/0"
    )
    error_message = "Provide a valid IPv4 CIDR and do not allow SSH from 0.0.0.0/0."
  }
}
