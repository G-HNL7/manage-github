module "repositories" {
  source     = "./modules/repository"
  for_each   = local.repositories
  name       = each.key
  repository = each.value

}
