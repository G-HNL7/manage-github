output "branches" {
  description = "Map of branch protection patterns keyed by for_each key"
  value       = { for k, v in github_branch_protection.this : k => v.pattern }
}

output "enforce_admins" {
  description = "Map of enforce_admins values keyed by for_each key"
  value       = { for k, v in github_branch_protection.this : k => v.enforce_admins }
}
