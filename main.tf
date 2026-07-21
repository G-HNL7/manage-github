module "repositories" {
  source     = "./modules/repository"
  for_each   = local.repositories
  name       = each.key
  repository = each.value

}

module "labels" {
  source          = "./modules/labels"
  for_each        = local.repositories
  repository      = each.key
  labels_profiles = lookup(each.value, "labels_profiles", "")
  labels          = local.labels

  depends_on = [
    module.repositories
  ]
}
module "branch_protection" {
  source                     = "./modules/branch_protection"
  for_each                   = local.repositories
  repository                 = each.key
  branch_protection_profiles = lookup(each.value, "branch_protection_profiles", [])
  branch_protections         = local.branch_protections
  depends_on = [
    module.repositories
  ]

}

module "rulesets" {
  source            = "./modules/rulesets"
  for_each          = local.repositories
  repository        = each.key
  rulesets_profiles = lookup(each.value, "rulesets_profiles", [])
  rulesets          = local.rulesets
  rules_profiles    = lookup(each.value, "rules_profiles", [])
  rules             = local.rules
  depends_on = [
    module.repositories
  ]

}
