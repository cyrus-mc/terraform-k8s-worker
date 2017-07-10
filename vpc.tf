/*
  Define security group controlling inbound and outbound access to
  Kubernetes Worker nodes
*/

resource "aws_security_group" "inbound-outbound" {

  description = "Define inbound and outbound traffic for Kubernetes Worker server nodes"

  /* link to the correct VPC */
  vpc_id = "${var.vpc_id}"

  tags {
    builtWidth        = "terraform"
    KubernetesCluster = "${var.name}"
    Name              = "kubernetes-worker-${var.name}"
  }
}

/*
  Define ingress rules

  Has to be done outside the group creation as Kubernetes will add/remove
  rules as part of provisioning and these would get over-written by terraform
*/
resource "aws_security_group_rule" "allow_all" {

  type = "ingress"

  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.inbound-outbound.id}"

}

/*
  Define egress rules
*/
resource "aws_security_group_rule" "allow_all-outbound" {

  type = "egress"

  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.inbound-outbound.id}"
}
