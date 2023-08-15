variable "project_id" {
  description = "Azure DevOps Project ID"
  type        = string
}

variable "name" {
  description = "The name of the git repository."
  type        = string
}

variable "default_branch" {
  description = "The ref of the default branch. Will be used as the branch name for initialized repositories. Defaults to main."
  type        = string
  default     = "main"
}

variable "init_type" {
  description = "The type of repository to create. Valid values: Uninitialized, Clean or Import. Defaults to Clean."
  type        = string
  default     = "Clean"

  validation {
    condition     = contains(["Uninitialized", "Clean", "Import"], var.init_type)
    error_message = "The init_type value must be one of Uninitialized, Clean or Import."
  }
}

variable "permissions" {
  description = <<EOT
  <br><b>branch_name:</b> The name of the branch to assign the permissions. Defaults to null.
  <br><b>principal:</b> The group principal to assign the permissions.
  <br><b>replace:</b> Replace (true) or merge (false) the permissions. Defaults to true
  <br><b>permissions:</b> The permissions to assign. The following permissions are available:
  <br><i>Administer:</i> NotSet
  <br><i>GenericRead:</i> NotSet
  <br><i>GenericContribute:</i> NotSet
  <br><i>ForcePush:</i> NotSet
  <br><i>CreateBranch:</i> NotSet
  <br><i>CreateTag:</i> NotSet
  <br><i>ManageNote:</i> NotSet
  <br><i>PolicyExempt:</i> NotSet
  <br><i>CreateRepository:</i> NotSet
  <br><i>DeleteRepository:</i> NotSet
  <br><i>RenameRepository:</i> NotSet
  <br><i>EditPolicies:</i> NotSet
  <br><i>RemoveOthersLocks:</i> NotSet
  <br><i>ManagePermissions:</i> NotSet
  <br><i>PullRequestContribute:</i> NotSet
  <br><i>PullRequestBypassPolicy:</i> NotSet
EOT
  type        = list(object({
    principal   = string
    branch_name = optional(string)
    replace     = optional(bool, true)
    permissions = object({
      Administer              = optional(string, "NotSet")
      GenericRead             = optional(string, "NotSet")
      GenericContribute       = optional(string, "NotSet")
      ForcePush               = optional(string, "NotSet")
      CreateBranch            = optional(string, "NotSet")
      CreateTag               = optional(string, "NotSet")
      ManageNote              = optional(string, "NotSet")
      PolicyExempt            = optional(string, "NotSet")
      CreateRepository        = optional(string, "NotSet")
      DeleteRepository        = optional(string, "NotSet")
      RenameRepository        = optional(string, "NotSet")
      EditPolicies            = optional(string, "NotSet")
      RemoveOthersLocks       = optional(string, "NotSet")
      ManagePermissions       = optional(string, "NotSet")
      PullRequestContribute   = optional(string, "NotSet")
      PullRequestBypassPolicy = optional(string, "NotSet")
    })
  }))
  default = []
}