variable "repository" {
  description = "Repository name"
  type        = string
}

variable "labels_profiles" {
  description = "Selected label profiles assigned to the repository"
  type        = list(string)
}

variable "labels" {
  description = "All available label profiles"
  type = map(map(object({
    color       = string
    description = string
  })))
}
