output "rulesets" {
  description = "Map of created ruleset names keyed by for_each key"
  value       = { for k, v in github_repository_ruleset.this : k => v.name }
}
