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

resource aws_iam_group_policy mfa {

  group = aws_iam_group.group.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*",
      "Condition": {
          "Bool": {
              "aws:MultiFactorAuthPresent": ["true"]
          }
      }
    }
  ]
}
EOF
}
