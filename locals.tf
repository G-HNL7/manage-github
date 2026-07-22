locals {

  repositories = yamldecode(
    file("${path.module}/catalog/repositories.yaml")
  ).repositories

  labels = yamldecode(
    file("${path.module}/catalog/labels.yaml")
  ).labels

  branch_protections = yamldecode(
    file("${path.module}/catalog/branch_proteccions.yaml")
  ).branch_protections

  rulesets = yamldecode(
    file("${path.module}/catalog/rulesets.yaml")
  ).rulesets

  rules = yamldecode(
    file("${path.module}/catalog/rulesets.yaml")
  ).rulesets_rules

}


