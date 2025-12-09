# Terraform-ai
Project purpose: This repository contains Terraform configuration and GitHub Actions to provision AWS infrastructure and automate CI/CD for Terraform using GitHub Actions.

AWS resources being provisioned:
- VPC
- Subnet (public)
- Route Table
- Internet Gateway
- Security Group (SSH/HTTP)
- S3 bucket (for state)
- DynamoDB table (for state locking)

Workflows:
- `build.yml`: Runs `terraform init` and `terraform validate` to check Terraform syntax and configuration.
- `terraform-plan.yml`: Runs `terraform init` and `terraform plan` using AWS credentials from GitHub Secrets.
- `terraform-apply.yml`: Runs `terraform apply -auto-approve` (triggerable via workflow dispatch or after successful plan).

Usage:
- Set GitHub repository secrets: `AWS_REGION`, `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`.
- Update `terraform.tfvars` with a unique S3 bucket name before applying in CI.
- Run workflows from the `dev` branch.
# Terraform-ai