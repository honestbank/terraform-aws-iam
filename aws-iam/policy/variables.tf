variable "policy" {
  description = "Policy"
  type = object({
    name        = string
    path        = string
    description = string
    policy      = string
  })
  default = null
}

variable "aws_region" {
  description = "AWS Region"
}

variable "aws_role_arn" {
  description = "AWS Role ARN"
  default     = null
}

