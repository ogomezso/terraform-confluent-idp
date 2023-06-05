# Confluent Cloud Credentials  

variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "environment" {
  type        = string
  description = "Environment id"
}

variable "cluster" {
  type        = string
  description = "Confluent cloud Kafka Cluster ID"
}

variable "identity_provider" {
  type        = string
  description = "Identity provider Id"
}

variable "grant_list" {
  type = list(object({
    identity_pool = object({
      display_name   = string
      description    = optional(string)
      identity_claim = string
      filter         = string
    })
    resource        = string
    resource_prefix = string
    role            = string
  }))

}
