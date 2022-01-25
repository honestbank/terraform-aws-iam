variable "user" {
  description = "The user to create"
  type = object({
    name = string
    path = string
    tags = map(any)
    groups = list(string) # group names
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
