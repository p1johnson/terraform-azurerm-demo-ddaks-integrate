variable "management_subscription_id" {
  type = string
}

variable "connectivity_subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "northeurope"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "aks_resource_group_name" {
  type = string
}

variable "log_analytics_resource_group_name" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}
