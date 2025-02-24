variable "user" {
  description = "The user to create"
  type = object({
    groups = list(string) # group names
    name   = string
    path   = string
    tags   = optional(map(any))
  })
  nullable = false
}
