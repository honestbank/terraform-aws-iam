
variable "group" {
  description = "Name and path of group"
  type = object({
    name  = string
    path  = string
    policies = list(string) # policy arns
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

