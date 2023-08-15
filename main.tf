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

resource "azuredevops_git_permissions" "principal" {
  for_each = {for v in var.permissions : v.branch_name == null ? v.principal : "${v.principal} | ${v.branch_name}" => v}

  project_id    = var.project_id
  repository_id = azuredevops_git_repository.main.id

  branch_name = each.value.branch_name
  principal   = each.value.principal
  replace     = each.value.replace
  permissions = each.value.permissions
}