# This will enable the vpc to connect to the internet
resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "prod-igw"
  }
}
#======================================================================================================
# Create a custom route table (crt) for public subnet. public subnet can reach to the internet by using this.
resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    // associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    // CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.prod-igw.id
  }

  tags = {
    Name = "prod-public-crt"
  }
}

# Associate CRT and subnet
resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.id
}

#
# create a security group for the e2
# allow ssh  port 22 for all the internet. 
# Also, visitors can reach our EC2 as port 80 is open
#
resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.prod-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] // this will allow up to 219.255.255.255
    // cidr_blocks = ["219.0.0.0/8"] // this will allow up to 219.255.255.255
    // could also try 219.90.0.0/16
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    // Put your office or home address in it! 
    // /8 will make it 49.0.0.0 - 49.255.255.255
    cidr_blocks = ["106.0.0.0/8","60.0.0.0/8"]
    //cidr_blocks = ["49.0.0.0/8"]
  }
  //If you do not add this rule, you can not reach the NGIX  
  // can only access this from the same subnet in AWS
  ingress {
    from_port   = 0
    //from_port   = 80
    //to_port     = 80
    to_port     = 1024
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }
  tags = {
    Name = "ssh-allowed"
  }
}


