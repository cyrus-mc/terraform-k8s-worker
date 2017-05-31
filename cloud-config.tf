/*
  Create user data for a worker instance
*/
data "template_file" "cloud-config" {

  template = "${file("${path.module}/cloud-config.yml")}"

  vars {
    CLUSTER_NAME     = "${var.name}"

    LABELS           = "${var.node_labels}"

    K8S-VERSION      = "v1.5.4_coreos.0"

    AWS_REGION       = "${var.region}"

    /* Point at the etcd ELB */
    ETCD_ELB         = "etcd.${var.name}.${var.internal-tld}"

    /* point at the API service ELB */
    API_ELB          = "apiserver.${var.name}.${var.internal-tld}"

    DNS_SERVICE_IP   = "${cidrhost(var.service_ip_range, 10)}"

    NETWORK_PLUGIN   = "cni"
  }

}
