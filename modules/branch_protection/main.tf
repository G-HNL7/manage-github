resource "github_branch_protection" "this" {
  for_each      = local.selected_profiles
  repository_id = var.repository
  pattern       = each.value.pattern

  enforce_admins   = each.value.enforce_admins
  allows_deletions = each.value.allows_deletions

  allows_force_pushes = each.value.allows_force_pushes

  required_pull_request_reviews {

    dismiss_stale_reviews = each.value.required_pull_request_reviews.dismiss_stale_reviews

    require_code_owner_reviews = each.value.required_pull_request_reviews.require_code_owner_reviews

    required_approving_review_count = each.value.required_pull_request_reviews.required_approving_review_count
  }

  required_status_checks {

    strict = each.value.required_status_checks.strict

    contexts = each.value.required_status_checks.contexts
  }
}
