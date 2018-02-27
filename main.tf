provider "aws" {
  region = "${var.aws_region}"

  profile = "${var.aws_profile}"
}

#Adding VPC information to the file

resource "aws_vpc" "hub_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    name = "hub_vpc"
  }
}

#Adding internet gateway to VPC

resource "aws_internet_gateway" "hub_igw" {
  vpc_id = "${aws_vpc.hub_vpc.id}"

  tags {
    name = "hub_igw"
  }
}

#Adding public subnets to VPC

resource "aws_subnet" "hub_subnet_public1" {
  vpc_id                  = "${aws_vpc.hub_vpc.id}"
  cidr_block              = "${var.cidrs["public1"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    name = "hub_subnet_public1"
  }
}

resource "aws_subnet" "hub_subnet_public2" {
  vpc_id                 = "${aws_vpc.hub_vpc_id }"
  cidr_block             = "${var.cidrs["public2"]}"
  map_public_ip_on_lauch = true
  availability_zone      = "${data.aws_availability_zones.available.names[1]  }  "

  tags {
    name = "hub_subnet_public2"
  }
}

#Adding privatee Subnets to VPC
resource "aws_subnet" "hub_subnet_private1" {
  vpc_id                  = "${aws_vpc.hub_vpc.id }"
  cidr_block              = "${var.cidrs["private1"]  }"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[0] }"

  tags {
    name = "hub_subnet_private1"
  }
}

resource "aws_subnet" "hub_subnet_private2" {
  vpc_id                       = "${aws_vpc.hub_vpc.id }"
  cidr_block                   = "${var.cidrs["private2"] }"
  map_public_host_ip_on_launch = false
  availability_zone            = "${data.availability_zones.available.names[1] }"

  tags {
    name = "hub_subnet_private2"
  }
}













