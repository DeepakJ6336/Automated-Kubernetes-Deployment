Hotstar Clone Automated Kubernetes Deployment (DevSecOps)
1. Solution Overview: CI/CD DevSecOps Pipeline
This repository contains a comprehensive, end-to-end DevSecOps pipeline designed to automatically build, secure, and deploy a Node.js web application (the Hotstar clone) onto a managed Kubernetes service on AWS. The solution is fully defined as code, demonstrating robust automation, infrastructure provisioning, and security integration.

The project successfully meets all core requirements of the take-home task and incorporates several advanced Bonus Requirements, showcasing a production-ready application delivery process.

2. Core Task Fulfillment
The pipeline is orchestrated by Jenkins and manages the entire lifecycle of the application:

Infrastructure as Code (IaC): The foundational Amazon EKS cluster and its associated networking resources (VPC, subnets, etc.) are provisioned entirely using Terraform, managed through a dedicated Jenkins pipeline job (Job 1).

Containerization: The application is containerized using a dedicated Dockerfile, built into an optimized image, and pushed to a public Docker registry.

Kubernetes Deployment: Standard Kubernetes YAML manifests (Deployment.yml and Service.yml) are used. The application is exposed via a LoadBalancer service provided by EKS.

CI/CD Pipeline: A multi-stage pipeline (Job 2) is configured to handle Git checkout, quality checks, image build/push, and the final deployment to the EKS cluster.

3. Advanced DevSecOps and Observability Integration
This solution goes beyond the core requirements by embedding crucial security and monitoring components:

Security Scanning: The CI/CD pipeline implements a "shift-left" DevSecOps approach by integrating three layers of scanning before deployment:

SonarQube for Static Code Analysis and enforcing a Quality Gate.

OWASP Dependency-Check for identifying known vulnerabilities in application dependencies.

Docker Scout for scanning the final container image for CVEs and providing remediation recommendations.

Secrets Management: All sensitive credentials, including Docker Hub login details, the SonarQube authentication token, and the Kubernetes kubeconfig file, are stored securely within Jenkins Credentials as Secret Text or Secret Files.


4. Execution Instructions
The entire process is managed via two main Jenkins pipeline jobs:

A. Job 1: EKS Infrastructure Provisioning
Navigate to the Automated Kubernetes Deployment pipeline in Jenkins.

The job is parameterized: select action: apply to provision the EKS cluster and its networking with Terraform, or select action: destroy to tear down the infrastructure.

B. Job 2: Application Deployment Pipeline
Navigate to the HOTSTAR Pipeline in Jenkins.

Run the job to execute the full DevSecOps flow: code checkout, security scans, image build/push, and deployment to the running EKS cluster.

Upon success, the application will be accessible via the Kubernetes LoadBalancer.

5. Deliverables
The complete source code is available in the public repository below, and the application is live and running.

Public GitHub Repository Link: 

Live Deployed Application URL: a44b9ce54c5a9441aa3e737ba3d8900f-46689954.ap-south-1.elb.amazonaws.com
