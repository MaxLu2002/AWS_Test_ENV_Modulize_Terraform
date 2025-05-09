# BASIC
region = "{YOUR_AWS_REGION}"
tags   = { Name = "{YOUR-PREFER-TAG}" }
# S3
bucket_count = 2
#VPC
vpc_count            = 2
vpc_cidr             = ["{YOUR_VPC_CIDR 1}", "{YOUR_VPC_CIDR 2}"] # i.e. 10.0.0.0/16
public_subnet_count  = 2
private_subnet_count = 2
availability_zones   = ["{YOUR_AWS_AZ}", "{YOUR_AWS_AZ}"] # i.e. ["a", "b"]

