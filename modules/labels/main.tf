resource "github_issue_label" "this" {

  for_each    = local.selected_profiles
  repository  = var.repository
  name        = each.key
  color       = each.value.color
  description = each.value.description
}

