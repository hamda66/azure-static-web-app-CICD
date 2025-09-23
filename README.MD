 # Azure Static Web App with Azure Functions – Terraform CI/CD Project

## Overview

This project demonstrates how to provision an **Azure Static Web App** integrated with an **Azure Linux Function App** using Terraform. It is designed for teams or individuals who want to automate the deployment of static websites with serverless backends, following Infrastructure as Code (IaC) and CI/CD best practices.

The infrastructure includes:
- **Azure Resource Group**
- **Azure Static Web App** (`test-site`)
- **Azure Storage Account** (for Function App storage)
- **Azure Linux Function App** (serverless backend)
- **Azure App Service Plan** (for the Function App)
- **Terraform** for repeatable, automated deployments

## Architecture

![Architecture Diagram](./architecture.png)  
*The Static Web App is connected to a Linux Function App, which uses a dedicated App Service Plan and Storage Account.*

## Features

- **Automated Infrastructure**: All resources are provisioned via Terraform.
- **CI/CD Ready**: Designed for integration with Azure DevOps, GitHub Actions, or other CI/CD tools.
- **Best Practices**: Follows Azure and Terraform best practices for naming, dependencies, and resource configuration.
- **Globally Unique Resources**: Uses random strings to ensure unique resource names.

## Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://www.terraform.io/downloads)
- An Azure subscription with permissions to create resources
- (Optional) A CI/CD platform (e.g., GitHub Actions, Azure DevOps)

## Setup Instructions

### 1. Clone the Repository

```sh
git clone <your-repo-url>
cd azure-static-web-app-CICD