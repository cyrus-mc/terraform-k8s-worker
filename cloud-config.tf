/*
  Create user data for a worker instance
*/
data "template_file" "cloud-config" {

  template = "${file("${path.module}/cloud-config.yml")}"

  vars {
    CLUSTER_NAME     = "${var.name}"

    LABELS           = "${jsonencode(var.node_labels)}"

    K8S-VERSION      = "v1.5.4_coreos.0"

    AWS_REGION       = "${var.region}"

    /* Point at the etcd ELB */
    ETCD_ELB         = "${var.etcd_elb}"
    ETCD_SERVERS     = "${jsonencode(var.etcd_servers)}"

    /* point at the API service ELB */
    API_ELB          = "${var.api_elb}"

    DNS_SERVICE_IP   = "${cidrhost(var.service_ip_range, 10)}"

    NETWORK_PLUGIN   = "cni"

    ANSIBLE_HOST_KEY     = "${var.ansible_host_key}"
    ANSIBLE_CALLBACK_URL = "${var.ansible_callback}"

  }

}
