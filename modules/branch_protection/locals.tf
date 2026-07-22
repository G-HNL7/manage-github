locals {
  selected_profiles = length(var.branch_protection_profiles) > 0 ? {
    for profile in var.branch_protection_profiles : profile => var.branch_protections[profile]
  } : {}
}
