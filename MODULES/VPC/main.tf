resource "aws_vpc" "vpc_module" {
  cidr_block = var.cidr-block
  tags = {
    Name = var.Name
  }
}

resource "aws_subnet" "public" {
    cidr_block = var.public_cidr
    vpc_id = aws_vpc.vpc_module.id
    availability_zone = var.availability_zone
    tags = {
        Name = "public_subnet"
    }
}

resource "aws_subnet" "private" {
    cidr_block = var.private_cidr
    vpc_id = aws_vpc.vpc_module.id
    availability_zone = var.availability_zone
    tags = {
        Name = "private_subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_module.id
    tags = {
        Name = "vpc_igw"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc_module.id

    tags = {
        Name = "public_rt"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.vpc_module.id

    tags = {
      Name = "private_rt"
    }
}

resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}    

resource "aws_route_table_association" "public_rt_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_assoc" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_rt.id
}
