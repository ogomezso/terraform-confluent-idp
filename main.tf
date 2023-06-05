data "confluent_identity_provider" "idp" {
  id = var.identity_provider
}

data "confluent_environment" "env" {
  id = var.environment
}

data "confluent_kafka_cluster" "cluster" {
  id = var.cluster
  environment {
    id = data.confluent_environment.env.id
  }
}

resource "confluent_identity_pool" "pool" {
  identity_provider {
    id = data.confluent_identity_provider.idp.id
  }
  for_each = {
    for index, idp in var.grant_list :
    idp.identity_pool.display_name => idp
  }
  display_name   = each.value.identity_pool.display_name
  description    = each.value.identity_pool.description
  identity_claim = each.value.identity_pool.identity_claim
  filter         = each.value.identity_pool.filter
}

resource "confluent_role_binding" "cluster_resource_rbac" {
  for_each = {
    for index, rbac in var.grant_list :
    rbac.identity_pool.display_name => rbac
  }
  principal   = "User:${confluent_identity_pool.pool[each.value.identity_pool.display_name].id}"
  role_name   = each.value.role
  crn_pattern = "${data.confluent_kafka_cluster.cluster.rbac_crn}/kafka=${data.confluent_kafka_cluster.cluster.id}/${each.value.resource}=${each.value.resource_prefix}"
}
