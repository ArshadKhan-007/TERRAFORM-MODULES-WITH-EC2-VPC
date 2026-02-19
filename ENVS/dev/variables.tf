variable "cidr-block" {
    description = "Your VPC cidr block"
    type = string
}

variable "Name" {
    description = "Your VPC name"
    type = string
}

variable "public_cidr" {
    description = "Your public subnet cidr"
    type = string
}

variable "private_cidr" {
    description = "Your private subnet cidr"
    type = string
}

variable "availability_zone" {
    description = "Your availability zone"
    type = string
}

variable "ami_id" {
    description = "Your instance ami id"
    type = string
}

variable "name" {
    description = "Your instance name"
    type = string
}

variable "instance_type" {
    description = "Your instance type"
    type = string
}
