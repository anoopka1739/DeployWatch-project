variable "project_name" {
  description = "Name of the project"
  type        = string

}

variable "region" {
  description = "region where the resources will be deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "eks_public_subnets_cidrs" {
  description = "List of public subnet CIDR blocks for EKS"
  type        = list(string)
}

variable "eks_private_subnets_cidr" {
  description = "List of private subnet CIDR blocks for EKS"
  type        = list(string)
}

variable "eks_cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Public IP allowed to SSH into bastion"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
}

variable "key_pair_name" {
  description = "Key pair for aws instance login"
  type        = string
  default     = "aws-key-pair-new"

}

variable "eks_node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
}