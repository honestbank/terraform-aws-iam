output "arn" {
  description = "The ARN of the user."
  value       = aws_iam_user.user.arn
}

output "name" {
  description = "The user's name."
  value       = aws_iam_user.user.name
}

output "tags_all" {
  description = "A map of all the tags assigned to the user."
  value       = aws_iam_user.user.tags_all
}

output "unique_id" {
  description = "The unique ID assigned by AWS - see https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#GUIDs"
  value       = aws_iam_user.user.unique_id
}

output "user" {
  value = aws_iam_user.user
}
