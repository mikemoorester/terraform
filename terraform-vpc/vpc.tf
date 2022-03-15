#========================================================================
# cidr_block 10.0.0.0/16 allows use of ip addresses that are in "10.0.X.X" 
# 65.536 IP addresses
#========================================================================
resource "aws_vpc" "prod-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = "prod-vpc"
  }
}


#========================================================================
# vpc_id: this subnet will be the vpc just created before. We give the created VPC id to the subnet.
# cidr_block: 10.0.1.0/24. We have 254 IP addresses in this subnet
# map_public_ip_on_launch: This is so important. The only difference between private and public subnet is this line. If it is true, it will be a public subnet, otherwise private.
#========================================================================
resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" // this flag ensures this will be a public subnet
  availability_zone       = "ap-southeast-2a"
  tags = {
    Name = "prod-subnet-public-1"
  }
}
