resource "github_repository" "this" {

  name = var.name

  description = var.repository.description

  visibility = var.repository.visibility

  auto_init = var.repository.auto_init

  has_issues   = var.repository.has_issues
  has_projects = var.repository.has_projects
  has_wiki     = var.repository.has_wiki

  allow_merge_commit = var.repository.allow_merge_commit
  allow_squash_merge = var.repository.allow_squash_merge
  allow_rebase_merge = var.repository.allow_rebase_merge

  delete_branch_on_merge = var.repository.delete_branch_on_merge

  archived = var.repository.archived

  gitignore_template = var.repository.gitignore_template

  license_template = var.repository.license_template

  topics = var.repository.topics

}
