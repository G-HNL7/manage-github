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
