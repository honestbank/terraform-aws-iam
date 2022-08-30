variable "user" {
  default     = null
  description = "The user to create"
  type = object({
    name   = string
    path   = string
    tags   = map(any)
    groups = list(string) # group names
  })
  nullable = true
}

variable "name" {
  default     = ""
  description = "The name of the user to create."
  type        = string
}

variable "path" {
  default     = ""
  description = "The path to create the user in."
  type        = string
}

variable "tags" {
  default     = {}
  description = "A string:string map of tags to associate with the user."
  type        = map(string)
}

variable "groups" {
  default     = []
  description = "The groups to place the user in."
  type        = list(string)
}
