# Disclaimer
The software included in this repository is intended for pilot use **only** and is recommended for deployment in a sandbox environment.

# DPN-Deployment

# DPN Terraform Modules

## Overview
This repository contains Terraform modules for deploying the DPN Infrastructure on Azure.
The modules are designed to deploy the pre-requisites for the DPN infrastructure, such as:
- AKS Cluster
- Azure Event Hub
- Azure Cosmos DB

Other modules are also available for deploying the DPN infrastructure components, such as:
- Azure Virtual Network
- Azure Log Analytics Workspace
- Azure Container Registry

Each module is designed to be deployed independently, and can be used to deploy the DPN infrastructure in a modular fashion, allowing for easy customisation and extension.

#### The current modules are configured to use a public IP address for the AKS cluster. They are specifically designed for sandbox and development environments and should not be used in production settings.

The terraform modules follow best practices from a security and compliance perspective, however it is recommended to review the modules and make any necessary changes to meet your specific requirements.

Each module contains a README file with detailed instructions on how to deploy the module, as well as the input and output variables that are available.

## Structure of the Repository
The repository is structured as follows:

- `azure_modules`: Contains the Terraform modules for deploying the DPN infrastructure on Azure.
- `deployment_module`: Invokes the Terraform modules in the `azure_modules` directory to deploy the DPN infrastructure on Azure.
- `environments`: Contains the Terraform configuration files for deploying the DPN infrastructure in different environments, such as sandbox, development, and production.
- `TEMPLATED_.github`: Contains the GitHub Actions workflows for deploying the DPN infrastructure on Azure using Terraform. This will need to be renamed to `.github` **before use**.

## Prerequisites
- As part of the deployment process, you will need to have the following prerequisites in place:
  - An Azure subscription
  - An Azure service principal with necessary permissions to add Role Assignments and create resources in the Azure subscription.
  - Terraform
  - Azure CLI
  - CIDR block for AKS Servie CIDR

## Instructions to Deploy the DPN Infrastructure on Azure
To make the deployment process easier, the repository contains a deployment module that invokes the Terraform modules in the `azure_modules` directory to deploy the DPN infrastructure on Azure.
As part of the deployment process follow the instructions below:

1. Clone/Copy the contents to your repository.
2. Rename the `TEMPLATED_.github` directory to `.github`.
3. Add the necessary secrets to the GitHub repository secrets. (Subscription ID, Service Principal ID, Service Principal Secret, Tenant ID). The secret names are need to be in the following format `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`.
4. If the subscription has no virtual network populate the `environment/sandbox/networking/terraform.tfvars` file with the necessary values. This will create the virtual network and log analytics workspace.
5. Once the code has been merged into the `main` branch this will trigger the `CD-DPN-NETWORK` workflow which will create the virtual network and log analytics workspace.
6. To deploy the DPN infrastructure populate the `environment/sandbox/dpn_deployment/terraform.tfvars` file with the necessary values.
7. Once the code has been merged into the `main` branch this will trigger the `CD-DPN` workflow which will create the DPN infrastructure.
