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

resource "aws_iam_user" "user" {
  name = var.user.name
  path = var.user.path

  tags = merge({
    createdBy = "createdBy aws-iam/user"
  }, var.user.tags)
}

resource "aws_iam_user_group_membership" "groups_attached" {
  user = aws_iam_user.user.name

  groups = var.user.groups
}
