resource "azuredevops_git_repository" "main" {
  project_id     = var.project_id
  name           = var.name
  default_branch = "refs/heads/${var.default_branch}"

  initialization {
    init_type = var.init_type
  }

  lifecycle {
    ignore_changes = [
      initialization
    ]
  }
}