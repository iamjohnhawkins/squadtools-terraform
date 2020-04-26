#========================== TEST VPC =============================

# Declare the data source
data "aws_availability_zones" "available" {}


# Define a vpc
resource "aws_vpc" "squadtools_vpc" {
  cidr_block = "${var.squadtools_network_cidr}"
  tags = {
    Name = "${var.squadtools_vpc}"
  }
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "squadtools_ig" {
  vpc_id = "${aws_vpc.squadtools_vpc.id}"
  tags = {
    Name = "squadtools_ig"
  }
}

# Public subnet 1
resource "aws_subnet" "squadtools_public_sn_01" {
  vpc_id = "${aws_vpc.squadtools_vpc.id}"
  cidr_block = "${var.squadtools_public_01_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    Name = "squadtools_public_sn_01"
  }
}

# Public subnet 2
resource "aws_subnet" "squadtools_public_sn_02" {
  vpc_id = "${aws_vpc.squadtools_vpc.id}"
  cidr_block = "${var.squadtools_public_02_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    Name = "squadtools_public_sn_02"
  }
}

# Routing table for public subnet 1
resource "aws_route_table" "squadtools_public_sn_rt_01" {
  vpc_id = "${aws_vpc.squadtools_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.squadtools_ig.id}"
  }
  tags = {
    Name = "squadtools_public_sn_rt_01"
  }
}

# Associate the routing table to public subnet 1
resource "aws_route_table_association" "squadtools_public_sn_rt_01_assn" {
  subnet_id = "${aws_subnet.squadtools_public_sn_01.id}"
  route_table_id = "${aws_route_table.squadtools_public_sn_rt_01.id}"
}

# Routing table for public subnet 2
resource "aws_route_table" "squadtools_public_sn_rt_02" {
  vpc_id = "${aws_vpc.squadtools_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.squadtools_ig.id}"
  }
  tags = {
    Name = "squadtools_public_sn_rt_02"
  }
}

# Associate the routing table to public subnet 2
resource "aws_route_table_association" "squadtools_public_sn_rt_assn_02" {
  subnet_id = "${aws_subnet.squadtools_public_sn_02.id}"
  route_table_id = "${aws_route_table.squadtools_public_sn_rt_02.id}"
}

# ECS Instance Security group
resource "aws_security_group" "squadtools_public_sg" {
  name = "squadtools_public_sg"
  description = "Test public access security group"
  vpc_id = "${aws_vpc.squadtools_vpc.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "${var.squadtools_public_01_cidr}",
      "${var.squadtools_public_02_cidr}"]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "squadtools_public_sg"
  }
}
