# sample_bucket

> Deploy a sample bucket to AWS with this template stack.

## Structure

- [base.tf](base.tf): Contains the basis of the stack, such as providers (e.g., AWS) and backend configuration (e.g., S3).
- [main.tf](main.tf): Contains the configuration of resources to be provisioned (e.g., S3 bucket).
  - Best practice is to keep this file as small as possible (e.g., storage.tf).
  - Break out the configuration into separate files.
- [terraform.tfvars](terraform.tfvars): Contains the values assigned to each variable (e.g., region).
  - Certain variable definitions files are [loaded automatically](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files).
- [variables.tf](variables.tf): Contains the definitions declared for each variable (e.g., region).

## Inputs

- PREFIX
- aws_region
- bucket_versioning

## Outputs

- sample_bucket_id
