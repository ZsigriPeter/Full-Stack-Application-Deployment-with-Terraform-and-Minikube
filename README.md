# Full-Stack Application Deployment with Terraform and Minikube

This project demonstrates how to deploy a full-stack web application (frontend + backend) using **Terraform** to provision Kubernetes resources locally on **Minikube**. The setup includes deployments, services, secrets, and ingress configuration.

## Project Overview

The project automates the deployment of a backend and frontend application using Kubernetes manifests defined in Terraform.

### Key Features

1. **Backend Deployment**
   - Python/Django backend container deployed in Kubernetes.
   - Environment variables and sensitive credentials stored in Kubernetes secrets.
   - Exposed via a ClusterIP service.

2. **Frontend Deployment**
   - React frontend container deployed in Kubernetes.
   - Exposed via a ClusterIP service.

3. **Ingress**
   - Single ingress resource to route traffic to frontend and backend.
   - `/api` paths route to backend, all other paths route to frontend.

4. **Secrets Management**
   - Email credentials and Firebase service account stored as Kubernetes secrets.
   - Mounted securely into backend container.

5. **Local Kubernetes Environment**
   - Minikube used for local testing.
   - Supports port-forwarding or Minikube tunnel for external access.

## Technologies

- [Terraform](https://www.terraform.io/)
- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes](https://kubernetes.io/)


## Installation and Setup

1. **Start Minikube**  
```bash
minikube start
```
2. **Clone this repository**

```bash
git clone <repo-url>
cd <repo-folder>/terraform
```

3. **Provide credentials**

 - Create a terraform.tfvars file with sensitive information (email credentials, project name, images, etc.).

- Include firebase_key.json in the backend folder.

4. **Initialize and apply Terraform**
```bash
terraform init
terraform apply
```

- Confirm with yes when prompted.

5. **Verify deployment**
```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

6. **Access the application**

- Either via Minikube tunnel:
```bash
minikube tunnel
```

- Then open the ingress IP in your browser.

- Or via port-forwarding for frontend:
```bash
kubectl port-forward svc/tac-frontend-service 8080:80
```

- Then access http://localhost:8080.