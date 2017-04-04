variable "region" {
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

variable "key_pair" {
  description = "SSH key-pair to attach to K8s nodes"
}

variable "auto_scaling_min_size" {
  description = "Auto-scaling group minimum size"
}

variable "auto_scaling_max_size" {
  description = "Auto-scaling group maximum size"
}

variable "auto_scaling_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
}
