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
https://github.com/PatSew/webapp/tree/feature/firsttask
 
2. Containerization
- Package the application into a Docker image.
- Provide a Dockerfile to build and run the application locally.
- Run the application in a Docker container to ensure functionality.
https://github.com/PatSew/webapp/tree/feature/secondtask
 
3. Infrastructure as Code (Terraform)
- Write a Terraform script that allows the infrastructure to be deployed in different environments (e.g., dev, staging, production).
- The script should provision:
    - Azure App Service
    - Azure Database (MySQL/PostgreSQL)
    - Vnet, Subnets
    - Private Endpoint
- Ensure variables can be used for different configurations.
https://github.com/PatSew/webapp/tree/feature/thirdtask
 
4. CI/CD Pipeline (Use Free Account)
Create a GitLab CI/CD or GitHub Actions pipeline to automate the following:
- Build and push the Docker image to a container registry (Azure Container Registry or Docker Hub).
- Deploy the Terraform infrastructure.
- Deploy the application to Azure App Service.
- Run some simple tests to verify the application.
https://github.com/PatSew/webapp/tree/feature/fourthtask
