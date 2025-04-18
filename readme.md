# Terraform Project Setup Guide

This guide provides step-by-step instructions to set up and apply Terraform configurations for your AWS environment.

*The commands mentioned in the repository are for PowerShell.

## Prerequisites

Ensure you have the following installed on your system:
- Python
- pip (Python package installer)
- Terraform

## Steps

1. **Install Python Dependencies**
    ```bash
    pip install -r requirements.txt
    ```

2. **Navigate to the Production Directory**
    ```bash
    cd ./prod/
    ```

3. **Configure Terraform Files**
    - **provider.tf**: Set the AWS account configuration. Ensure AWS CLI is configured with the appropriate credentials.
    - **main.tf**: Define the Terraform resources and modules you want to deploy.
    - **terraform.tfvars**: Set the variable configurations required by your Terraform scripts.

4. **Apply Terraform Configuration**
    ```bash
    terraform validate
    terraform plan
    terraform apply -auto-approve
    ```

5. **Destroy Terraform Resources (Optional)**
    ```bash
    terraform destroy -auto-approve
    ```

## Notes
- Make sure to review and update the Terraform files (`provider.tf`, `main.tf`, `terraform.tfvars`) according to your specific requirements before applying the configuration.
- Always validate and plan your Terraform changes before applying them to avoid unexpected results.

By following these steps, you can successfully set up and manage your AWS infrastructure using Terraform.





