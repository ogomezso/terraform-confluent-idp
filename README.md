# terraform-confluent-idp
Confluent Terraform Identity Provider Access Management Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >= 1.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | >= 1.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [confluent_identity_pool.pool](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/identity_pool) | resource |
| [confluent_role_binding.cluster_resource_rbac](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/role_binding) | resource |
| [confluent_environment.env](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/environment) | data source |
| [confluent_identity_provider.idp](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/identity_provider) | data source |
| [confluent_kafka_cluster.cluster](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/kafka_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Confluent cloud Kafka Cluster ID | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment id | `string` | n/a | yes |
| <a name="input_identity_pools"></a> [identity\_pools](#input\_identity\_pools) | n/a | <pre>list(object({<br>    identity_pool = object({<br>      display_name   = string<br>      description    = optional(string)<br>      identity_claim = string<br>      filter         = string<br>    })<br>    roles = list(object({<br>      resource        = string<br>      resource_prefix = string<br>      role            = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_identity_provider"></a> [identity\_provider](#input\_identity\_provider) | Identity provider Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ips"></a> [ips](#output\_ips) | n/a |
| <a name="output_rbac"></a> [rbac](#output\_rbac) | n/a |
<!-- END_TF_DOCS -->