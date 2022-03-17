# terraform
Terraform scripts to create simple services in AWS

## Terraform workflow

    terraform init * Set up the terraform project *   
    terraform verify * Check that the syntax is correct *  
    terraform fmt  * apply standard formatting to terraform files *  
    terraform apply * run the terrafrm script to apply the infrastructure in the cloud *  
    terraform destroy * remove everything you have just created in the terraform script *  


## Simple

Creates a ubunutu micro instance in the ap-southeast-2 zone.  

- ** main.tf ** - * Defines the provider (AWS hashicorp), ec2 instance type * 
- ** variables.tf ** - * Allows the tag of the instance to be defined at the command line * 
- ** outputs.tf ** - * Outputs the ec2 instance name and IP address to stdout * 

## terraform-vpc

Creates two instance within the same subnet within a VPC, an internet gateway, its own security policy and a key pair is uploaded to the servers

- ** ec2.tf ** - defines the two ec2 instances to be creates
- ** network.tf ** - defines the internet gateway, routing tables and security groups
- ** nginx.sh ** - installs nginx in the ubunut instance
- ** outputs.tf ** - Outputs the IP addresses of the two ec2 instances
- ** provider.tf ** - aws
- ** vars.tf ** - variables in the file, eg AWS REGION
- ** vpc.tf ** - contains the VPC and public subnet

To create the ssh key pair run the command:  
     ssh-keygen -f cyber-range-key-pair  

