# GitHub Actions Workflow for Azure Terraform Deployment

This repository contains a GitHub Actions workflow to deploy Azure resources using Terraform. The deployment is authenticated using OpenID Connect (OIDC), providing secure and seamless access to Azure without managing long-lived credentials. The workflow supports creating hub-and-spoke network topologies and virtual machines (VMs) in a development subscription.

---

## **Workflow Overview**

### **Trigger**
The workflow is triggered on a `push` event to the following branches:
- Any branch under the `feature/` prefix.
- The `main` branch .

### **Key Features**
- **Authentication**: Utilizes OIDC to authenticate with Azure via GitHub Actions.
- **Terraform Automation**: Automatically initializes, plans, and optionally applies Terraform configurations.
- **Resource Creation**:
  - Hub-and-spoke networks.
  - Virtual Machines (VMs) for the development subscription.
