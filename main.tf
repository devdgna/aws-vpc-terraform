terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  access_key = "enter your aws access key"
  secret_key = "enter your aws secret key"
}

# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "18.0.0.0/20"
}

# Create subnet (1a)
resource "aws_subnet" "public_subnet_one" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "18.0.0.0/23"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_one" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "18.0.2.0/23"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = false
}

# Create subnet (1b)
resource "aws_subnet" "public_subnet_two" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "18.0.4.0/23"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_two" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "18.0.6.0/23"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false
}

# Create IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id
}
