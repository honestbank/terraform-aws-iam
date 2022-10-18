lint:
	terraform fmt --recursive

validate:
	terraform init
	terraform validate
	terraform fmt --recursive

docs:
	rm -rf modules/*/.terraform modules/*/.terraform.lock.hcl
	rm -rf examples/*/.terraform examples/*/.terraform.lock.hcl
	terraform-docs -c .terraform-docs.yml .
