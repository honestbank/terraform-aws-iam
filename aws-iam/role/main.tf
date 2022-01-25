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

resource "aws_iam_role" "role" {
  name = var.role.name
  path = var.role.path

  tags = merge({
    createdBy = "terraform aws-iam/role"
  }, var.role.tags)
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  for_each   = toset(var.role.policies)
  role       = aws_iam_role.role.name
  policy_arn = var.role.policies[each.key]
}
