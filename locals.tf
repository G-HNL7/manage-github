locals {
  tags = {
    managed_by = "Terraform"
    platform   = "GitHub"

  }

  repositories = yamldecode(
    file("${path.module}/catalogs/repositories.yaml")
  ).repositories


}
