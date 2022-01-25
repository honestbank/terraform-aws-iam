variable "policy" {
  description = "Policy"
  type = object({
    name        = string
    path        = string
    description = string
    policy      = string
  })
  nullable = false
}

variable "aws_region" {
  description = "AWS Region"
}
