# Terraform-Exercises
Real World, Self Starter Terraform Examples

<center>

| Example        | Description  |
| ------------- |:-------------:|
| GKE Cluster      | [GKE](/GKE)|

</center>

## Running an Example

1. First you need to setup a workspaces, so isolate env better.

    `terraform workspace new prod`

    `terraform workspace select prod`
2. `terraform plan -var-file=$(terraform workspace show).tfvars`
3. `terraform apply -var-file=$(terraform workspace show).tfvars`

## Destorying

1. terraform destroy -var-file=$(terraform workspace show).tfvars

Regards,

<b>Rahul Sharma</b>

DevOps / SRE / Architect.

Website: https://rvsharma.com

Email:  me@rvsharma.coms
