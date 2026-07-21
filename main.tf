module "repositories" {
  source     = "./modules/repository"
  for_each   = local.repositories
  name       = each.key
  repository = each.value

}

module "labels" {
  source     = "./modules/labels"
  for_each   = local.repositories
  repository = each.key
  profile    = lookup(each.value, "labels", "")
  labels     = local.label_profiles

  depends_on = [
    module.repositories
  ]
}
