# GitHub Actions Workflow for Terraform Deployment

This repository contains a GitHub Actions workflow to deploy Azure resources using Terraform. The deployment is authenticated using OpenID Connect (OIDC), providing secure and seamless access to Azure/AWS without managing long-lived credentials. The workflow supports creating hub-and-spoke network topologies and virtual machines (VMs) in a development subscription.

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

---

## **Workflow File**
Below is a summary of the workflow configuration:

```yaml
on:
  push:
    branches:
      - feature/*
      - main

permissions:
  id-token: write
  contents: read

jobs:
  AzureTerraform:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Azure Login
      uses: azure/login@v1
      with:
        client-id: ${{ secrets.AZURE_CLIENT_ID }}
        tenant-id: ${{ secrets.AZURE_TENANT_ID }}
        subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
        
    - name: Run Terraform Plan
      working-directory: ./Azure
      run: |
        terraform init
        terraform plan
        # terraform apply
        # sleep 100
        # terraform destroy
