provider "aws" {
  region                      = var.aws_region
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.private_network_cidr
}
# create a public VPC
resource "aws_vpc" "main_pub" {
  cidr_block = var.public_master_subnet_cidr
}

# Create a private subnet for master nodes
resource "aws_subnet" "private_master_subnet" {
  count                   = 1
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  availability_zone       = "us-east-1a"  # Replace with your desired availability zone
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
}

# Create a private subnet for worker nodes
resource "aws_subnet" "private_worker_subnet" {
  count                   = 1
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 2)
  availability_zone       = "us-east-1b"  # Replace with your desired availability zone
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
}

# Create a public subnet for master nodes
resource "aws_subnet" "public_master_subnet" {
  count                   = 1
  cidr_block              = cidrsubnet(var.public_master_subnet_cidr,3,1)
  availability_zone       = "us-east-1c"  # Replace with your desired availability zone
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main_pub.id
}



output "public_master_subnet_cidr_block" {
  value = aws_subnet.public_master_subnet[0].cidr_block
}
# Create instances
resource "aws_instance" "master_instance" {
  count         = var.num_master_nodes
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     =  aws_subnet.public_master_subnet[0].id
  # Add other necessary configurations
  tags = {
    Name = "k8s-master-${count.index}"
  }
}

resource "aws_instance" "worker_instance" {
  count         = var.num_worker_nodes
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_worker_subnet[0].id
  # Add other necessary configurations
  tags = {
    Name = "k8s-worker-${count.index}"
  }
}

# Create a test instance
resource "aws_instance" "test_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  # key_name      = "your-key-pair-name"  # Replace with your key pair name
  subnet_id     = aws_subnet.private_master_subnet[0].id

  tags = {
    Name = "example-instance"
  }
}

