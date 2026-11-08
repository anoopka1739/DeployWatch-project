#Documentation on how the private eks is build for this project in AWS

1. Resource configuration

Region	ap-south-1
VPC	10.0.0.0/16
Public subnets	2 × /24
Private subnets	2 × /24
Availability Zones	2
Internet Gateway	1
NAT Gateway	1 (cost-saving lab setup)
Bastion	Amazon Linux 2023, t3.micro
EKS	Private endpoint only
Kubernetes nodes	Managed node group, 2 × t3.medium
Kubernetes version	Latest version supported by our chosen Terraform AWS provider and EKS

We'll use two worker nodes initially, one in each private subnet. The NAT Gateway will be in one AZ, so this is a learning environment rather than a fully AZ-resilient production architecture.


For our project:
Resource	Subnet	Public IP?
Bastion EC2	Public	Yes
EKS worker nodes	Private	No
EKS control plane	AWS-managed	No public endpoint
NAT Gateway	Public	Has Elastic IP