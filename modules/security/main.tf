# vpc
resource "aws_vpc" "vpc-main" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# ig
resource "aws_internet_gateway" "gw-main" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "${var.project_name}-ig"
  }
}

# get available azs
data "aws_availability_zones" "available_zones" {
  
}

# pub subnet 1
resource "aws_subnet" "pub-sub_1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.pub-sub_1-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-pub-sub_1"
  }
}

# pub subnet 2
resource "aws_subnet" "pub-sub_2" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.pub-sub_2-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-pub-sub_2"
  }
}

# rt and public routes
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-main.id
  }

  tags = {
    Name = "${var.project_name}-public_rt"
  }
}

# pub sub 1 - public rt association
resource "aws_route_table_association" "pub-sub_1-rt-assoc" {
  subnet_id = aws_subnet.pub-sub_1.id
  route_table_id = aws_route_table.public-rt.id
}

# pub sub 2 - public rt association
resource "aws_route_table_association" "pub-sub_2-rt-assoc" {
  subnet_id = aws_subnet.pub-sub_2.id
  route_table_id = aws_route_table.public-rt.id
}


# pvt app subnet 1
resource "aws_subnet" "pvt-app-sub_1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.pvt-app-sub_1-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-pvt-app-sub_1"
  }
}

# pvt app subnet 2
resource "aws_subnet" "pvt-app-sub_2" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.pvt-app-sub_2-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-pvt-app-sub_2"
  }
}

# pvt data subnet 1
resource "aws_subnet" "pvt-data-sub_1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.pvt-data-sub_1-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-pvt-data-sub_1"
  }
}

# pvt data subnet 2
resource "aws_subnet" "pvt-data-sub_2" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.pvt-data-sub_2-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-pvt-data-sub_2"
  }
}