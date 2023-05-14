terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "tfstates"
    dynamodb_table = "tfstates"
    key            = "cac1-sample.tfstate"
    region         = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region

  # Merge default tags with user-defined ones.
  default_tags {
    tags = merge(
      var.tags,
      {
        Stack     = basename(abspath(path.root)) # E.g., "cac1-sample"
        Terraform = terraform.workspace          # E.g., "default"
      },
    )
  }
}
