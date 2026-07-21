locals {

  repositories = yamldecode(
    file("${path.module}/catalog/repositories.yaml")
  ).repositories

  label_profiles = yamldecode(
    file("${path.module}/catalog/labels.yaml")
  ).labels

}
