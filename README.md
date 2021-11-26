# bergentroll_microservices

bergentroll microservices repository

## docker-2

Issues:

- Seems command from tasks uses system mongo conf
- There is some Ruby dependencies trouble: bundler installs old unsupported
  mongo lib

What is done: branch is meeting homework requirements including 🌟.

How to use ifrastructure declaration:
```bash
pushd docker-monolith/infra/packer/
# You may create variables file from variables.json.example
packer build -var-file=variables.json docker.json
popd 

pushd docker-monolith/infra/terraform/
# Terraform requires variables, see terraform.tfvars.example
terraform apply -auto-approve
popd 

pushd docker-monolith/infra/ansible/
# Inventory populates with terrafrom apply
ansible-playbook monolith.yml --tags app
popd 
```
