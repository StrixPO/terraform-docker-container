# 🚀 Task 3: Infrastructure as Code (IaC) with Terraform

## 🧠 Objective

Provision a local Docker container using **Terraform** to demonstrate the basics of Infrastructure as Code (IaC).

---

## 🛠️ Tools & Technologies

- Terraform (v1.x)
- Docker (Desktop, Local)
- Terraform Docker Provider (`kreuzwerker/docker`)

---

## 📂 Project Structure

. ├── main.tf # Terraform configuration file ├── .gitignore # Ignore Terraform state files and logs └── README.md # Project overview and documentation

pgsql
Copy code

---

## ⚙️ Terraform Configuration (`main.tf`)

This project provisions an NGINX container running locally on port 8080.

```hcl
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
  name  = "nginx_server"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}
```
---
🧪 Steps Performed
1️⃣ Terraform Initialization
bash
Copy code
terraform init
📄 Paste the output here:

bash
Copy code
Initializing the backend...
Initializing provider plugins...
- Reusing previous version of kreuzwerker/docker from the dependency lock file
- Using previously-installed kreuzwerker/docker v3.0.2

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

...
Terraform has been successfully initialized!
2️⃣ Terraform Execution Plan
bash
Copy code
terraform plan
📄 Paste the output here:

Terraform used the selected providers to generate the following execution plan.     
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "nginx:latest"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "nginx_server"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8080
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

3️⃣ Apply Infrastructure
bash
Copy code
terraform apply
📄 Paste the output here:

yaml
Copy code
Terraform used the selected providers to generate the following execution plan.     
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "nginx:latest"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "nginx_server"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8080
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 19s [id=sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eabnginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 2s [id=3fd44a037fd4170d65f6b719b35faaa1fa7340456c45c43ac063484500077b21]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

4️⃣ Access the NGINX App
Open your browser at http://localhost:8080 — you should see the default NGINX welcome page.

5️⃣ Destroy Infrastructure
bash
Copy code
terraform destroy
📄 Paste the output here:

yaml
Copy code
# 👉 Example
docker_image.nginx: Refreshing state... [id=sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eabnginx:latest]
docker_container.nginx: Refreshing state... [id=3fd44a037fd4170d65f6b719b35faaa1fa7340456c45c43ac063484500077b21]

Terraform used the selected providers to generate the following execution plan.     
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "3fd44a037fd4" -> null        
      - id                                          = "3fd44a037fd4170d65f6b719b35faaa1fa7340456c45c43ac063484500077b21" -> null
      - image                                       = "sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eab" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "nginx_server" -> null        
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - mac_address               = "9e:45:01:34:92:b6"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (7 unchanged attributes hidden)

      - ports {
          - external = 8080 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eabnginx:latest" -> null
      - image_id     = "sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eab" -> null
      - keep_locally = false -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eab" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

docker_container.nginx: Destroying... [id=3fd44a037fd4170d65f6b719b35faaa1fa7340456c45c43ac063484500077b21]
docker_container.nginx: Destruction complete after 1s
docker_image.nginx: Destroying... [id=sha256:09369da6b10306312cd908661320086bf87fbae1b6b0c49a1f50ba531fef2eabnginx:latest]
docker_image.nginx: Destruction complete after 2s

Destroy complete! Resources: 2 destroyed.

✅ Key Concepts Practiced
Terraform Basics & Commands (init, plan, apply, destroy)

Provider Configuration (kreuzwerker/docker)

Resource Provisioning (docker_image, docker_container)

Terraform State Management

