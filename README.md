Sample web app that store and retrieve data (Python + Postgresql)
Overview:
<p align="center">
  <img src="web_1.png" alt="Screenshot of Django restaurants website" />
</p>

DB Health check:
<p align="center">
  <img src="web_2.png" alt="Screenshot of Django restaurants website" />
</p>

1. Deploy an Application on Azure (Use Free Account)
- Create an Azure App Service that connects to a MySQL or PostgreSQL database using a private endpoint.
- The application should have a basic UI that interacts with the database (e.g., storing and retrieving data).
- Provide a simple web application (Node.js, Python, or any preferred language).
- Implement a test that verifies the database connection.
- All these Azure Resources should be created thought Infrastructure as Code (Terraform)

How to run Web App:
1. Checkout code
2. 'cd tf-app/staging'
3. 'terraform init'
4. 'terraform plan -out plan.out'
5. 'terraform apply plan.out'
6. Run .github/workflows/pipeline.yml (or add commit to repo - it will trigger pipeline automatically)
7. Open https://app-webapp-staging-3216787432.azurewebsites.net
8. DB health check available at https://app-webapp-staging-3216787432.azurewebsites.net/db-health