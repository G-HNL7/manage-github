variable "repository" {
  type = string
}

variable "required_checks" {

  type = list(string)

  default = [
    "Terraform Format",
    "Terraform Validate"
  ]
}

variable "rules" {
  description = "Ruleset profile assigned to the repository"
  type = map(object({
    rules = optional(object({
      deletion                = optional(bool, true)
      non_fast_forward        = optional(bool, true)
      required_linear_history = optional(bool, true)
      pull_request = optional(object({
        dismiss_stale_reviews_on_push   = optional(bool, true)
        require_code_owner_review       = optional(bool, true)
        required_approving_review_count = optional(number, 1)
      }))
      required_status_checks = optional(object({
        strict   = optional(bool, true)
        contexts = optional(list(string), [])
      }), null)
    }))
    }
  ))
}

variable "rules_profiles" {
  description = "Selected rules profiles assigned to the repository"
  type        = list(string)
}

variable "rulesets" {
  description = "Rulesets to apply"
  type = map(object({
    target      = string
    enforcement = string
    conditions = object({
      include = list(string)
      exclude = list(string)
    })
  }))
}

variable "rulesets_profiles" {
  description = "Rulesets profile assigned to the repository"
  type        = list(string)
}
