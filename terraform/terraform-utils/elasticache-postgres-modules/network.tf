provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "default" {
  id = var.eks_vpc
}

data "aws_subnet_ids" "apps_subnets" {
  vpc_id = var.eks_vpc 
}

resource "aws_db_subnet_group" "rds" {
  name = "rds-${var.sandbox_id}-subnet-group"
  subnet_ids = [aws_subnet.a.id,aws_subnet.b.id]
}

resource "aws_db_parameter_group" "default" {
  name   = "postgres13"
  family = "postgres13"
}

resource "aws_elasticache_subnet_group" "elasticache-subnet" {
  name       = "elasticache-subnet"
  subnet_ids = data.aws_subnet_ids.apps_subnets.ids
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "all" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.a.id
  route_table_id = aws_route_table.all.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.b.id
  route_table_id = aws_route_table.all.id
}