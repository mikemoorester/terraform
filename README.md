# Terraform
Terraform scripts to create simple services in AWS

# Run

- git clone this repository
- log into AWS SSO 
- retrieve the AWS access key 
- set environment variables for programmatic CLI access (see below)
- run terraform

The copy the variables and paste them into your terminal:
```bash
export AWS_ACCESS_KEY_ID="_________"
export AWS_SECRET_ACCESS_KEY="__________"
export AWS_SESSION_TOKEN="________"
```

### cheat sheet

```bash
cd terraform-vpc
terraform init                                      # set up the terraform project   
terraform verify                                    # check that the syntax is correct  
terraform fmt                                       # apply standard formatting to terraform files  
terraform apply                                     # run the terrafrm script to apply the infrastructure in the cloud 
terraform apply -var "instance_name=YetAnotherName" # example of specifying a variable at the command line 
terraform destroy                                   # remove everything you have just created in the terraform script  
```

## Simple

Creates a ubunutu micro instance in the ap-southeast-2 zone.  

- **main.tf** - *Defines the provider (AWS hashicorp), ec2 instance type* 
- **variables.tf** - *Allows the tag of the instance to be defined at the command line* 
- **outputs.tf** - *Outputs the ec2 instance name and IP address to stdout* 

## terraform-vpc

Creates three instance within the same subnet within a VPC, an internet gateway, its own security policy and a key pair is uploaded to the servers

- **ec2.tf** - defines the three ec2 instances to be created
- **network.tf** - defines the internet gateway, routing tables and security groups
- **nginx.sh** - installs nginx on an ubuntu instance
- **outputs.tf** - Outputs the IP addresses of the two ec2 instances
- **provider.tf** - aws
- **vars.tf** - variables in the file, eg AWS REGION
- **vpc.tf** - contains the VPC and public subnet

To create the ssh key pair run the command:
```bash
ssh-keygen -f cyber-range-key-pair  
```
