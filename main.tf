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
  alias  = "target"
  assume_role {
    role_arn = var.aws_role_arn
  }
}

data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["ec2:Describe*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

module "aws-iam-policy" {
  source = "./aws-iam/policy"

  policy = {
    name        = "test-policy"
    description = "test policy"
    path        = "/"

    policy = data.aws_iam_policy_document.example.json
  }
}




module "aws-iam-group" {
  source = "./aws-iam/group"

  group = {
    name     = "test-group"
    path     = "/"
    policies = module.aws-iam-policy.policy_arn
  }
}

module "aws-iam-user" {
  source = "./aws-iam/user"

  user = {
    name   = "test-user"
    path   = "/"
    groups = [module.aws-iam-group.group.name]
    tags = {
       
    }
  }
}
