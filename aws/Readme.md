# Kubernetes Cluster on AWS with Terraform

This repository provides Terraform configuration files to set up a basic Kubernetes cluster on AWS. The infrastructure includes master and worker nodes distributed across private and public subnets.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed
- AWS account and access key

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/BhargaVNaiduV/terraform.git
cd terraform/aws
# Kubernetes Cluster on AWS with Terraform

This repository provides Terraform configuration files to set up a basic Kubernetes cluster on AWS. The infrastructure includes master and worker nodes distributed across private and public subnets.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed
- AWS account and access key

## Getting Started

### Clone the Repository

# variables.tf
variable "aws_region" {
  default = "us-east-1"
}

# Add other variables as needed

terraform init

terraform apply




