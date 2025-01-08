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



