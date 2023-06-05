output "ips" {
  value = confluent_identity_pool.pool
}

output "rbac" {
  value = confluent_role_binding.cluster_resource_rbac  
}