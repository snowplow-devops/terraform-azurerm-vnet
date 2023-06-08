output "vnet_id" {
  description = "The ID of the vNet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the vNet"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_subnets" {
  description = "The IDs of subnets created inside the vNet"
  value       = local.subnets[*].id
}

output "vnet_subnets_name_id" {
  description = "Can be queried subnet ID by subnet name by using lookup(module.vnet.vnet_subnets_name_id, subnet1)"
  value       = local.subnets_name_id_map
}
