terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "terraform-states"
    dynamodb_table = "terraform-states"
    key            = "sample_bucket.tfstate"
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

  default_tags {
    tags = {
      Stack     = basename(abspath(path.root)) # E.g., "sample_bucket"
      Terraform = terraform.workspace          # E.g., "default"
    }
  }
}
