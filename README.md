# terraform
Terraform scripts to create siple services in AWS

## Simple
Creates a ubunutu micro instance in the ap-southeast-2 zone.

#### main.tf
Defines the provider (AWS hashicorp), ec2 instance type
#### variables.tf
Allows the tag of the instance to be defined at the command line
#### outputs.tf
Outputs the ec2 instance name and IP address the command line

terraform init 
terraform verify
terraform fmt
terraform apply
terraform destroy

## terraform-vpc

terraform-vpc/ec2.tf
terraform-vpc/network.tf
terraform-vpc/nginx.sh
terraform-vpc/outputs.tf
terraform-vpc/provider.tf
terraform-vpc/vars.tf
terraform-vpc/vpc.tf
