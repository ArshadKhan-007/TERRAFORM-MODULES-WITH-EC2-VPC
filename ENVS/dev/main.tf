module "ec2" {
    source = "../../MODULES/EC2"
    name = var.name
    ami_id = var.ami_id
    instance_type = var.instance_type
    public_subnet_id = module.vpc.public_subnet_id
}

module "vpc" {
    source = "../../MODULES/VPC"
    cidr-block = var.cidr-block
    availability_zone = var.availability_zone
    private_cidr = var.private_cidr
    public_cidr = var.public_cidr
    Name = var.Name
}



