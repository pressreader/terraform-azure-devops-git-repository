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