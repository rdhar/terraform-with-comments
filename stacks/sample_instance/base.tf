terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket = "twc-terraform-states"
    key    = "sample_instance.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Stack     = basename(abspath(path.root)) # E.g., "sample_instance".
      Terraform = terraform.workspace          # E.g., "default".
    }
  }
}
