variable "role" {
  description = "The role to create"
  type = object({
    name = string
    path = string
    tags = map(any)
    assume_role_policy = string
    policies = list(string) # policy arn
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

