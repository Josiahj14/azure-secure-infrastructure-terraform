## Project Overview
This project demonstrates the design and implementation of secure Azure infrastructure using Terraform and automated CI/CD workflows through GitHub Actions. 

This environment includes Azure networking, Network Security Groups, secured storage resources, and a separate Azure Blob Storage backend for Terraform state management. Infrastructure changes are validated through Terraform and Checkov security scanning, with OIDC-based authentication and approval controls used to secure deployment workflows.

This project emphasizes Infrastructure as Code (IaC), security automation, controlled deployments, and infrastructure testing and remediation.

## Project Objectives
- Provision and manage Azure infrastructure using Terraform, including virtual networks, subnets, Network Security Groups, and secured storage.
- Configure a remote Terraform state backend using Azure Blob Storage to support centralized infrastructure state management.
- Implement GitHub Actions CI/CD workflows to automate Terraform validation, security scanning, and controlled deployments.
- Integrate Checkov to identify infrastructure security misconfigurations before changes are merged.
- Secure GitHub Actions authentication to Azure using Microsoft Entra ID and OpenID Connect (OIDC), eliminating the need for long-lived Azure client secrets.
- Enforce infrastructure change controls through pull request reviews, branch protection, and deployment approvals
- Validate security controls through infrastructure testing, misconfiguration detection, and remediation.

## Technologies
- Cloud Platform: Microsoft Azure
- Infrastructure as Code (IaC): Terraform
- CI/CD & Version Control: GitHub Actions, Git, GitHub
- Security & Identity: Checkov, Microsoft Entra ID, OpenID Connect (OIDC)
- Azure Networking: Virtual Networks (VNets), Subnets, Network Security Groups (NSGs)
- Storage & State Management: Azure Storage Accounts, Azure Blob Storage, Terraform Remote State
- Command-Line Tools: Azure CLI, Terraform CLI

## Project Architecture

![Azure Infrastructure Architecture](diagrams/azure-infrastructure-architecture.png)

This project uses a Terraform-based infrastructure architecture integrated with GitHub Actions for automated validation, security scanning and controlled Azure deployments.

The architecture separates infrastructure provisioning, authentication, Terraform state management, and Azure resources into distinct components.

### Architecute Components

- **GitHub Actions CI/CD:** Automates Terraform validation, Checkov security scanning, controlled infrastructure deployments through pull requests and approval workflows.
- **Microsoft Entra ID & OIDC:** Establishes federated authentication between GitHub Actions and Azure, allowing workflows to obtain short-lived credentials without storing long-lived Azure client secrets.
- **Terraform:** Defines the Azure infrastructure as code, generates execution plans, and provisions or updates resources through controlled deployment workflows.
- **Terraform Remote State Backend:** Stores Terraform state in an Azure Blob Storage container within a separate resource group (rg-terraform-state-dev). Terraform uses this state to track and manage provisioned infrastructure.
- **Azure Application Infrastructure:** Contains the virtual network, subnet, Network Security Group, and secured Storage Account within rg-azure-secure-infra-dev.

## Infrastructure Security Design

The environment incorporates multiple security controls, including restricted inbound network traffic through NSG rules, disabled public network access on the application Storage Account, automated infrastructure security scanning, and approval requirements for infrastructure deployments.

Separating Terraform state storage from the application infrastructure also establishes a distinct management boundary for infrastructure state.