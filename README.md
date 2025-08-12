Sample web app that store and retrieve data (Python + Postgresql)
Overview:
<p align="center">
  <img src="web_1.png" alt="Screenshot of Django restaurants website" />
</p>

DB Health check:
<p align="center">
  <img src="web_2.png" alt="Screenshot of Django restaurants website" />
</p>

3. Infrastructure as Code (Terraform)
- Write a Terraform script that allows the infrastructure to be deployed in different environments (e.g., dev, staging, production).
- The script should provision:
    - Azure App Service
    - Azure Database (MySQL/PostgreSQL)
    - Vnet, Subnets
    - Private Endpoint
- Ensure variables can be used for different configurations.

How to configure proper environment
1. Checkout code
2. 'cd tf-app'
3. 'cd <env>/core'  (dev/staging/prod - you can modify parameters for each env in relevant 'terraform.tfvars' files)
4. 'terraform init'
5. 'terraform plan -out plan.out'
6. 'terraform apply plan.out'

```bash
├── README.md
├── application
├── tf-app
│   ├── dev
│   │   └── core
│   │       ├── backend.tf
│   │       ├── main.tf
│   │       ├── provider.tf
│   │       ├── terraform.tfvars
│   │       └── variables.tf
│   ├── prod
│   │   └── core
│   │       ├── backend.tf
│   │       ├── main.tf
│   │       ├── provider.tf
│   │       ├── terraform.tfvars
│   │       └── variables.tf
│   └── staging
│       └── core
│           ├── backend.tf
│           ├── main.tf
│           ├── provider.tf
│           ├── terraform.tfvars
│           └── variables.tf
├── tf-modules
│   ├── tf-app
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── tf-db
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── tf-network
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── web_1.png
└── web_2.png
```
