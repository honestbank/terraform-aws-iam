output "arn" {
  description = "The ARN of the user."
  value       = module.user.arn
}

output "name" {
  description = "The user's name."
  value       = module.user.name
}

output "tags_all" {
  description = "A map of all the tags assigned to the user."
  value       = module.user.tags_all
}

output "unique_id" {
  description = "The unique ID assigned by AWS - see https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#GUIDs"
  value       = module.user.unique_id
}
