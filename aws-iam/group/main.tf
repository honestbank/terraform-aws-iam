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

resource "aws_iam_group" "group" {
  name = var.group.name
  path = var.group.path
}

resource "aws_iam_group_policy_attachment" "policy_attachments" {
  for_each   = toset(var.group.policies)
  group      = aws_iam_group.group.name
  policy_arn = each.value
}
