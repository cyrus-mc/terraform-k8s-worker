/*
  Define security group controlling inbound and outbound access to
  Kubernetes Worker nodes
*/

resource "aws_security_group" "inbound-outbound" {

  description = "Define inbound and outbound traffic for Kubernetes Worker server nodes"

  /* link to the correct VPC */
  vpc_id = "${var.vpc_id}"

  /*
    Define ingress rules
  */
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  /*
    Define egress rules
  */
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags {
    builtWidth        = "terraform"
    KubernetesCluster = "${var.name}"
    Name              = "kubernetes-worker-${var.name}"
  }
}
