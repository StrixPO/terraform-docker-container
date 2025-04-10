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
```
terraform init
```
```
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
```
2️⃣ Terraform Execution Plan
```
terraform plan
```

3️⃣ Apply Infrastructure
```
terraform apply
```
```
Terraform used the selected providers to generate the following execution plan.     
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  # docker_image.nginx will be created

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 19s 
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 2s 

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

4️⃣ Access the NGINX App
```
 http://localhost:8080
``` 

5️⃣ Destroy Infrastructure
```
terraform destroy
```
```
Terraform used the selected providers to generate the following execution plan.     
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:
  # docker_container.nginx will be destroyed
Destroy complete! Resources: 2 destroyed.
```
✅ Key Concepts Practiced
- Infrastructure as Code (IaC) with Terraform
- Docker container provisioning
- Use of Terraform providers, resources, variables, outputs
- Clean separation of config files
- Local testing and reproducibility

