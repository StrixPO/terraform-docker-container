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

🧪 Steps Performed
1️⃣ Terraform Initialization
bash
Copy code
terraform init
📄 Paste the output here:

bash
Copy code
# 👉 Example (replace with yours)
Initializing the backend...
Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "3.0.2"...
...
Terraform has been successfully initialized!
2️⃣ Terraform Execution Plan
bash
Copy code
terraform plan
📄 Paste the output here:

vbnet
Copy code
# 👉 Example
Plan: 2 to add, 0 to change, 0 to destroy
3️⃣ Apply Infrastructure
bash
Copy code
terraform apply
📄 Paste the output here:

yaml
Copy code
# 👉 Example
docker_image.nginx: Creating...
docker_container.nginx: Creating...
Apply complete! Resources: 2 added.
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
Destroy complete! Resources: 2 destroyed.
📸 Screenshots (Optional but Recommended)
Screenshot of Docker Desktop showing the running container

Screenshot of the browser with the NGINX page

Screenshot of terraform apply or terminal output

✅ Key Concepts Practiced
Terraform Basics & Commands (init, plan, apply, destroy)

Provider Configuration (kreuzwerker/docker)

Resource Provisioning (docker_image, docker_container)

Terraform State Management

