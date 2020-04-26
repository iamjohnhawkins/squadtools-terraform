resource "aws_appautoscaling_target" "ecs_squadtools_target" {
  max_capacity       = 2
  min_capacity       = 1
  resource_id        = "service/squadtools_cluster/squadtools_app_service"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  depends_on      = [ "aws_ecs_service.squadtools_app_service"]
}
