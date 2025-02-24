variable "role" {
  description = "The role to create"
  type = object({
    assume_role_policy = string
    name               = string
    path               = string
    policies           = list(string) # policy arn
    tags               = optional(map(any))
  })
  nullable = false
}
