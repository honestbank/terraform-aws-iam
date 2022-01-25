terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.aws_role_arn
  }
}

resource "aws_iam_policy" "policy" {
  name        = var.policy.name
  path        = var.policy.path
  description = var.policy.description
  
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = var.policy.policy
}

# we compose arn here as role is created where we have access wether this is from 
# assume role or the user actually accessing.
locals {
  arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.policy.name}"
}


data "aws_caller_identity" "current" {}
