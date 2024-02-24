variable "aws_region" {
  default = "us-east-1"
}

variable "access_key" {
  default = "test"
}

variable "secret_key" {
  default = "test"
}

variable "private_network_cidr" {
  default = "192.168.0.0/16"
}

variable "public_master_subnet_cidr" {
  description = "CIDR block for the public subnet of master nodes"
}

variable "num_master_nodes" {
  default = 3
}

variable "num_worker_nodes" {
  default = 8
}

