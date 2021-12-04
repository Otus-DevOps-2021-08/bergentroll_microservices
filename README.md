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

## docker-3

As it seems for me useful hours have been spent.

Optimized dockerfiles created for microservice installation. Dockerfile.0 files
provides Alpine-based Ruby environment.

Sabbe sattā bhavantu sukhi-tattā!

## docker-4

Docker Compose adds so-called project name as a prefix for entries it owns. By
default it seems the last directory in the `$PWD`. It may be overrided with
`COMPOSE_PROJECT_NAME` environment variable e.g. in env-file.
