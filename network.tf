resource "azurerm_virtual_network_peering" "hub_to_aks" {
  provider                  = azurerm.connectivity
  name                      = "${data.tfe_outputs.harness.values.connectivity_hub_vnet_name}-to-${data.tfe_outputs.core.values.aks_cluster_vnet_name}"
  resource_group_name       = data.tfe_outputs.harness.values.connectivity_hub_resource_group_name
  virtual_network_name      = data.tfe_outputs.harness.values.connectivity_hub_vnet_name
  remote_virtual_network_id = data.tfe_outputs.core.values.aks_cluster_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "aks_to_hub" {
  name                      = "${data.tfe_outputs.core.values.aks_cluster_vnet_name}-to-${data.tfe_outputs.harness.values.connectivity_hub_vnet_name}"
  resource_group_name       = data.tfe_outputs.core.values.aks_cluster_resource_group_name
  virtual_network_name      = data.tfe_outputs.core.values.aks_cluster_vnet_name
  remote_virtual_network_id = data.tfe_outputs.harness.values.connectivity_hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
}
