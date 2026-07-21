variable "name" {
  description = "Repository name"
  type        = string
}

variable "repository" {

  description = "Repository configuration"

  type = object({

    description            = optional(string, "")
    visibility             = optional(string, "private")

    auto_init              = optional(bool, true)

    has_issues             = optional(bool, true)
    has_projects           = optional(bool, false)
    has_wiki               = optional(bool, false)

    allow_merge_commit     = optional(bool, false)
    allow_squash_merge     = optional(bool, true)
    allow_rebase_merge     = optional(bool, false)

    delete_branch_on_merge = optional(bool, true)

    archived               = optional(bool, false)

    gitignore_template     = optional(string)

    license_template       = optional(string)

    topics                 = optional(list(string), [])

  })

}
