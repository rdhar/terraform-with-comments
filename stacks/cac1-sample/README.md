# cac1-sample

> This is an example of a sample stack to demonstrate basic functionality of Terraform's AWS provider orchestration.

## Structure

- [base.tf](base.tf): Contains the basis of the stack, such as the providers (e.g., AWS) and backend configuration (e.g., S3).
- [main.tf](main.tf): Contains the configuration of resources to be provisioned (e.g., EC2 instance).
  - Best practice is to keep this file as small as possible.
  - Break out the configuration into separate files (e.g., "compute.tf").
- [terraform.tfvars](terraform.tfvars): Contains the values assigned to each variable (e.g., tags).
  - Certain variable definitions files are [loaded automatically](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files).
- [variables.tf](variables.tf): Contains the definitions declared for each variable (e.g., tags).

## Inputs

- tags
- region
- instance_type

## Outputs

- sample_instance_arn
