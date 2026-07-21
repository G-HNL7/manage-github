variable "branch_protection_profiles" {
  description = "Branch protection profiles to apply"
  type        = list(string)
}

variable "branch_protections" {

  description = "Branch protection configuration"

  type = map(object({
    description         = optional(string, "")
    pattern             = optional(string)
    enforce_admins      = optional(bool, true)
    allows_deletions    = optional(bool, false)
    allows_force_pushes = optional(bool, false)
    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = optional(bool, true)
      require_code_owner_reviews      = optional(bool, true)
      required_approving_review_count = optional(number, 1)
    }))
    required_status_checks = optional(object({
      strict   = optional(bool, true)
      contexts = optional(list(string), ["Terraform Format", "Terraform Validate"])
    }))
    required_approving_review_count = optional(number, 1)
  }))
}


variable "repository" {
  description = "Repository ID/NAME"
  type        = string
}
