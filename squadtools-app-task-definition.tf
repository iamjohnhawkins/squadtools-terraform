data "aws_ecs_task_definition" "squadtools_app" {
  task_definition = "${aws_ecs_task_definition.squadtools_app.family}"
  depends_on = ["aws_ecs_task_definition.squadtools_app"]
}

resource "aws_ecs_task_definition" "squadtools_app" {
  family                = "squadtools_app"
  container_definitions = <<DEFINITION
[
  {
    "name": "squadtools_app",
    "image": "${var.squadtools_app_image}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ],
    "environment": [
    ],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "squadtools_app",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "memory": 1024,
    "cpu": 256
  }
]
DEFINITION
}
