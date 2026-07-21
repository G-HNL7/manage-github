resource "github_repository_ruleset" "this" {
  for_each    = local.selected_rulesets_profiles
  repository  = var.repository
  name        = each.key
  enforcement = each.value.enforcement
  target      = each.value.target
  conditions {
    ref_name {
      include = each.value.conditions.include
      exclude = each.value.conditions.exclude
    }
  }

  rules {
    deletion                = local.selected_rules_profiles.rules.deletion
    non_fast_forward        = local.selected_rules_profiles.rules.non_fast_forward
    required_linear_history = local.selected_rules_profiles.rules.required_linear_history

    dynamic "pull_request" {
      for_each = local.selected_rules_profiles.rules.pull_request != null ? [local.selected_rules_profiles.rules.pull_request] : []
      content {
        dismiss_stale_reviews_on_push   = pull_request.value.dismiss_stale_reviews_on_push
        require_code_owner_review       = pull_request.value.require_code_owner_review
        required_approving_review_count = pull_request.value.required_approving_review_count
      }
    }

    dynamic "required_status_checks" {
      for_each = local.selected_rules_profiles.rules.required_status_checks != null ? [local.selected_rules_profiles.rules.required_status_checks] : []
      content {
        strict_required_status_checks_policy = required_status_checks.value.strict

        dynamic "required_check" {
          for_each = required_status_checks.value.contexts
          content {
            context = required_check.value
          }
        }
      }
    }
  }
}
