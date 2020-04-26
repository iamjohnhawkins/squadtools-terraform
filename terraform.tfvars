# You may need to edit these variables to match your config
ecs_cluster="squadtools_cluster"
ecs_key_pair_name="squadtools_key_pair"
region= "eu-west-1"
squadtools_app_image= "johnhawkins/squadtools:latest"

# no need to change these unless you want to
squadtools_vpc = "squadtools_vpc"
squadtools_network_cidr = "210.0.0.0/16"
squadtools_public_01_cidr = "210.0.0.0/24"
squadtools_public_02_cidr = "210.0.10.0/24"
max_instance_size = 3
min_instance_size = 1
desired_capacity = 2
