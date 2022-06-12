variable "policy" {
  description = "Policy"
  type = object({
    name        = string
    path        = string
    description = string
    policy      = string
    tags        = map(any)
  })
  nullable = false
}
