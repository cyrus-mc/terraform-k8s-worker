variable "vpc_id" {
  description = "ID of the VPC where the Kubernetes cluster will be deployed"
}

variable "region" {
  description = "AWS region where the K8s worker nodes will be deployed"
}

variable "internal-tld" {
  description = "Top-level domain for K8s clusters (defaults to k8s)"
  default     = "k8s"
}

variable "api_elb" {
  description = "Kubernetes API server Elastic Load Balancer"
}

variable "etcd_elb" {
  description = "Etcd Elastic Load Balancer"
}

variable "etcd_servers" {
  description = "Etcd server list"
  type        = "list"
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

variable "auto_scaling_min_size" {
  description = "Auto-scaling group minimum size"
}

variable "auto_scaling_max_size" {
  description = "Auto-scaling group maximum size"
}

variable "auto_scaling_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "ansible_server" {
  description = "FQDN or IP of the Ansible server"
}

variable "ansible_callback" {}

variable "ansible_host_key" {}
