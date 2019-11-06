resource "aws_vpc" "app-deploy" {
  cidr_block = "10.0.0.0/16"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.app-deploy.id}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id            = "${aws_vpc.app-deploy.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.availability_zones[0]}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id            = "${aws_vpc.app-deploy.id}"
  cidr_block        = "10.0.5.0/24"
  availability_zone = "${var.availability_zones[1]}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_subnet" "public-subnet3" {
  vpc_id            = "${aws_vpc.app-deploy.id}"
  cidr_block        = "10.0.6.0/24"
  availability_zone = "${var.availability_zones[2]}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id            = "${aws_vpc.app-deploy.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.availability_zones[0]}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = "${aws_vpc.app-deploy.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.availability_zones[1]}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_subnet" "private-subnet3" {
  vpc_id            = "${aws_vpc.app-deploy.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.availability_zones[2]}"

  tags = {
    environment = "development"
    author      = "anand-gautam"
  }
}

resource "aws_route_table" "public-route" {
  vpc_id = "${aws_vpc.app-deploy.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    environment = "development"
    author      = "anand-gautam"
    type        = "public to internet"
  }
}

resource "aws_route_table_association" "public-route" {
  subnet_id      = "${aws_subnet.public-subnet1.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_route_table_association" "public-route2" {
  subnet_id      = "${aws_subnet.public-subnet2.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_route_table_association" "public-route3" {
  subnet_id      = "${aws_subnet.public-subnet3.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}
