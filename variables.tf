variable "container_name" {
  type        = string
  default     = "nginx_server"
  description = "Name of the Docker container"
}

variable "image_name" {
  type        = string
  default     = "nginx:latest"
  description = "Docker image to use"
}

variable "external_port" {
  type        = number
  default     = 8080
  description = "Port to expose the app on host machine"
}
