output "region" {
  value = "${var.region}"
}

output "squadtools_vpc_id" {
  value = "${aws_vpc.squadtools_vpc.id}"
}

output "squadtools_public_sn_01_id" {
  value = "${aws_subnet.squadtools_public_sn_01.id}"
}

output "squadtools_public_sn_02_id" {
  value = "${aws_subnet.squadtools_public_sn_02.id}"
}

output "squadtools_public_sg_id" {
  value = "${aws_security_group.squadtools_public_sg.id}"
}

output "ecs-service-role-arn" {
  value = "${aws_iam_role.ecs-service-role.arn}"
}

output "ecs-instance-role-name" {
  value = "${aws_iam_role.ecs-instance-role.name}"
}

output "app-alb-load-balancer-name" {
  value = "${aws_alb.squadtools_alb_load_balancer.name}"
}

output "app-alb-load-balancer-dns-name" {
  value = "${aws_alb.squadtools_alb_load_balancer.dns_name}"
}

output "squadtools-app-target-group-arn" {
  value = "${aws_alb_target_group.squadtools_app_target_group.arn}"
}

