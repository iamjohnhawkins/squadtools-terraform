resource "aws_ecs_cluster" "squadtools_ecs_cluster" {
  name = "${var.ecs_cluster}"
}
