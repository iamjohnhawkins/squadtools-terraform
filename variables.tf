# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "ecs_key_pair_name" {
  description = "ECS key pair name"
}

variable "region" {
  description = "AWS region"
}

variable "availability_zone" {
  description = "availability zone used for the film ratings, based on region"
  default = {
    eu-west-1 = "eu-west-1"
  }
}

variable "squadtools_app_image" {
  description = "Docker image for the squadtools application"
}

########################### Test VPC Config ################################

variable "squadtools_vpc" {
  description = "VPC for Squadtools environment"
}

variable "squadtools_network_cidr" {
  description = "IP addressing for Squadtools Network"
}

variable "squadtools_public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "squadtools_public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
}
