variable "vpc_id" {
  description = "ID of the VPC where the Kubernetes cluster will be deployed"
}

variable "region" {
  description = "AWS region where the K8s worker nodes will be deployed"
}

variable "api_elb" {
  description = "Kubernetes API server Elastic Load Balancer"
}

variable "etcd_elb" {
  description = "Etcd Elastic Load Balancer"
}

variable "etcd_servers" {
  type        = "list"
  description = "Etcd server list"
}

variable "name" {
  description = "Cluster name"
}

variable "ami" {
  description = "The Amazon Machine Image (AMI)"
  type        = "map"
  default {
    "us-west-2"     = "ami-37ee6357"
    "us-gov-west-1" = "ami-05971364"
  }
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
  default     = "10.3.0.0/24"
}

variable "node_labels" {
  description = "Labels to assign node (key=value comman separated)"
  type        = "map"
}

variable "iam_instance_profile" {
  description = "IAM instance profile associated with worker instances"
}

variable "key_pair" {
  description = "SSH key-pair to attach to K8s nodes"
}

variable "auto_scaling" {
  description = "Auto Scaling Group min, max size and desired capacity"
  type = "map"
  default {
    "min"     = "1"
    "max"     = "1"
    "desired" = "1"
  }
}

variable "ansible_callback" {
}

variable "ansible_host_key" {
  default = "kubernetes-worker"
}
