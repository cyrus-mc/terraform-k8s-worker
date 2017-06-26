/*
  Create launch configuration used by Auto Scaling group to launch EC2 instances
*/
resource "aws_launch_configuration" "k8s-worker" {

  /* increase root device space */
  root_block_device {
    volume_size = "100"
  }

  /* add additional volume (/var/lib/docker) */
  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = "100"
    volume_type = "gp2"
  }

  image_id      = "${var.ami}"
  instance_type = "${var.instance_type}"

  iam_instance_profile = "${var.iam_instance_profile}"

  key_name      = "${var.key_pair}"

  security_groups = [ "${aws_security_group.inbound-outbound.id}" ]

  # user data supplied to provision each instance
  user_data = "${data.template_file.cloud-config.rendered}"

  lifecycle {
    create_before_destroy = true
  }

}

/*
  Create auto-scaling group
*/
resource "aws_autoscaling_group" "k8s-worker" {

  launch_configuration = "${aws_launch_configuration.k8s-worker.name}"

  health_check_grace_period = 60
  health_check_type         = "EC2"

  force_delete = true

  min_size         = "${var.auto_scaling_min_size}"
  max_size         = "${var.auto_scaling_max_size}"
  desired_capacity = "${var.auto_scaling_desired_capacity}"

  /* subnet(s) to launch instances in */
  vpc_zone_identifier = [ "${var.subnets}" ]

  tag {
    key                 = "Name"
    value               = "k8s-worker"
    propagate_at_launch = true
  }

  tag {
    key                 = "builtWith"
    value               = "terraform"
    propagate_at_launch = true
  }

  tag {
    key                 = "KubernetesCluster"
    value               = "${var.name}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
