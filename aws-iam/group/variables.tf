variable "group" {
  description = "Name and path of group"
  type = object({
    name  = string
    path  = string
    policies = list(string) # policy arns
  })
  nullable = false
}
