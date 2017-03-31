variable "aws_region" {
  description = "AWS region where the K8s worker nodes will be deployed"
}

variable "internal-tld" {
  description = "Top-level domain for K8s clusters (defaults to k8s)"
  default     = "k8s"
}

variable "name" {
  description = "Cluster name"
}

variable "ami" {
  description = "The Amazon Machine Image (AMI)"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.large"
}

variable "subnets" {
  description = "List of subnets where instances will be deployed to"
  type        = "list"
}

variable "service_ip_range" {
  description = "Service IP network"
}

variable "iam_instance_profile" {
  description = "IAM instance profile associated with worker instances"
}
