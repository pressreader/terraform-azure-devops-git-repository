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

  permissions = [
    {
      principal   = "Descriptor of a group"
      branch_name = "master" # Defaults to null
      replace     = true     # Defaults to true
      permissions = {
        Administer              = "NotSet" # Defaults to NotSet
        GenericRead             = "allow"  # Defaults to NotSet
        GenericContribute       = "allow"  # Defaults to NotSet
        ForcePush               = "deny"   # Defaults to NotSet
        CreateBranch            = "NotSet" # Defaults to NotSet
        CreateTag               = "NotSet" # Defaults to NotSet
        ManageNote              = "NotSet" # Defaults to NotSet
        PolicyExempt            = "NotSet" # Defaults to NotSet
        CreateRepository        = "NotSet" # Defaults to NotSet
        DeleteRepository        = "NotSet" # Defaults to NotSet
        RenameRepository        = "NotSet" # Defaults to NotSet
        EditPolicies            = "NotSet" # Defaults to NotSet
        RemoveOthersLocks       = "NotSet" # Defaults to NotSet
        ManagePermissions       = "NotSet" # Defaults to NotSet
        PullRequestContribute   = "NotSet" # Defaults to NotSet
        PullRequestBypassPolicy = "NotSet" # Defaults to NotSet
      }
    }
  ]
}
```