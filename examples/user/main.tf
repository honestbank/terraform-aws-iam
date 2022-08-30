provider "aws" {

}

resource "random_id" "run_id" {
  byte_length = 4
}

module "user" {
  source = "../../modules/user"

  name = "terraform-aws-iam-example-user-${random_id.run_id.hex}"
  path = "/"
  tags = {
    example = "true"
  }
  groups = []
}
