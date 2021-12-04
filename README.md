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

## gitlab-ci-1

To set up GitLab server:
- Go into `docker-monolith/infra/packer/`, prepare `variables.json` and build
  an image with `packer build -var-file=variables.json docker.json` command.
- Go into `docker-monolith/infra/terraform/`, prepare `terraform.tfvars` and
  create an instance with command `terraform apply -auto-approve`. Be sure to
  properly set the variables, `inventory_output_dir` should point to
  `../../gitlab-ci/ansible/`.
- Go into `gitlab-ci/ansible/` and apply the playbook with command
  `ansible-playbook gitlab.yml`.
