terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.12.0"
    }
  }
}

resource "aws_iam_group" "group" {
  name = var.group.name
  path = var.group.path
}

resource "aws_iam_group_policy_attachment" "policy_attachments" {
  count      = length(var.group.policies)
  group      = aws_iam_group.group.name
  policy_arn = var.group.policies[count.index]

  depends_on = [
    aws_iam_group.group,
  ]
}
