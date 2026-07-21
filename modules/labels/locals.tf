locals {
  selected_profiles = merge([
    for profile in var.labels_profiles : lookup(
      var.labels,
      profile,
      {}
    )
  ]...)
}
