variable "repository" {
  description = "Repository name"
  type        = string
}

variable "profile" {
  description = "Label profile assigned to the repository"
  type        = string
}

variable "labels" {
  description = "All available label profiles"
  type        = map(any)
}
