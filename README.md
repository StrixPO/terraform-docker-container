# Task 3: Infrastructure as Code (IaC) with Terraform

## 📌 Objective
Provision a local Docker container using Terraform to understand the basics of Infrastructure as Code (IaC).

---

## 🧰 Tools & Technologies Used
- **Terraform** v1.x
- **Docker** (Local)
- Terraform Docker Provider: `kreuzwerker/docker`

---

## 🗂️ Files
- `main.tf` — Terraform configuration for provisioning the container
- `.gitignore` — Ignores Terraform state files and logs

---

## 🚀 Steps Performed

1. **Initialized Terraform:**
   ```bash
   terraform init
   ```
   ```output
      Initializing the backend...
```
Initializing provider plugins...
- Reusing previous version of kreuzwerker/docker from the dependency lock file
- Using previously-installed kreuzwerker/docker v3.0.2

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other     
commands will detect it and remind you to do so if necessary.
```


2. Reviewed the execution plan:

bash
Copy code
terraform plan
Provisioned Docker Container:

bash
Copy code
terraform apply
Pulled nginx:latest image

Created a container named nginx_server

Exposed port 8080 mapped to internal port 80

Tested Application:

Accessed app via http://localhost:8080

Verified NGINX was running

Destroyed Infrastructure (Clean-up):

bash
Copy code
terraform destroy
📸 Screenshots / Logs
Attached screenshots of:

terraform apply

Running container in Docker Desktop

Browser with NGINX welcome page

Execution logs included as execution-log.txt

🧠 Key Concepts Learned
What is Infrastructure as Code (IaC)

How to use Terraform to provision Docker containers

Importance of terraform plan, apply, and destroy

Terraform state management

Declarative approach to infrastructure
