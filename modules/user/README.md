<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.groups_attached](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | The groups to place the user in. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the user to create. | `string` | `""` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to create the user in. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A string:string map of tags to associate with the user. | `map(string)` | `{}` | no |
| <a name="input_user"></a> [user](#input\_user) | [DEPRECATED] Object containing all the variables below. | <pre>object({<br>    name   = string<br>    path   = string<br>    tags   = map(any)<br>    groups = list(string) # group names<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the user. |
| <a name="output_name"></a> [name](#output\_name) | The user's name. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of all the tags assigned to the user. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | The unique ID assigned by AWS - see https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#GUIDs |
| <a name="output_user"></a> [user](#output\_user) | n/a |
<!-- END_TF_DOCS -->
