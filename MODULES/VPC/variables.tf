variable "cidr-block" {
    description = "Value of vpc cidr"
    type = string
}

variable "Name" {
    description = "Value of vpc name tag"
    type = string
}

variable "public_cidr" {
    description = "public cidr"
    type = string
}

variable "private_cidr" {
    description = "private cidr"
    type = string
}

variable "availability_zone" {
    description = "availability zone for subnets"
    type = string
}

