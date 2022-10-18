terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.12.0"
    }
  }
}

resource "aws_iam_user" "user" {
  name = (var.user == null) ? var.name : var.user.name
  path = (var.user == null) ? var.path : var.user.path

  force_destroy = true

  tags = ((var.user == null) ? var.tags : var.user.tags)
}

resource "aws_iam_user_group_membership" "groups_attached" {
  user = aws_iam_user.user.name

  groups = (var.user == null) ? var.groups : var.user.groups
}
