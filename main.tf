terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = var.external_port
  }
}

resource "docker_image" "alpine" {
  name         = "alpine:latest"
  keep_locally = false
}

resource "docker_container" "alpine" {
  name    = "alpine_debug"
  image   = docker_image.alpine.name
  command = ["sleep", "3600"]
}

