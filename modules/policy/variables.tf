variable "policy" {
  description = "Policy"
  type = object({
    description = string
    name        = string
    path        = string
    policy      = string
    tags        = optional(map(any))
  })
  nullable = false
}
