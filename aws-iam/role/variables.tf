variable "role" {
  description = "The role to create"
  type = object({
    name = string
    path = string
    tags = map(any)
    policies = list(string) # policy names
  })
  default = null
}

variable "aws_region" {
  description = "AWS Region"
  default     = null
}

variable "aws_role_arn" {
  description = "AWS Role ARN"
  default     = null
}

