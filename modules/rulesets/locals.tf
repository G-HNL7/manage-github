
locals {
  selected_rules_profiles = length(var.rules_profiles) > 0 ? merge([
    for profile in var.rules_profiles : var.rules[profile]
    ]...) : {
    rules = {
      deletion                = true
      non_fast_forward        = true
      required_linear_history = true
      pull_request = {
        dismiss_stale_reviews_on_push   = true
        require_code_owner_review       = true
        required_approving_review_count = 1
      }
      required_status_checks = {
        strict   = true
        contexts = []
      }
    }
  }

  selected_rulesets_profiles = length(var.rulesets_profiles) > 0 ? {
    for profile in var.rulesets_profiles : profile => var.rulesets[profile]
  } : {}
}
