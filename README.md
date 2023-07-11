# Azure DevOps Git Repository Terraform module

Terraform module which creates Git Repository in Azure DevOps

## Usage

```terraform
module "git_repository" {
  source = "git::https://github.com/pressreader/terraform-azure-devops-git-repository.git?ref=1.0.0"

  project_id = "ID of Azure DevOps project"

  name = "Name of repository"

  default_branch = "main"  # Defaults to main
  init_type      = "Clean" # Defaults to Clean
}
```