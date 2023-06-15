data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name = var.name

  address_space = [var.address_space]

  resource_group_name = var.resource_group_name
  location            = data.azurerm_resource_group.rg.location

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = { for _, s in var.subnets : s.name => s }

  name = each.value.name

  address_prefixes = [each.value.address_prefix]

  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  service_endpoints    = lookup(var.subnet_service_endpoints, each.value.name, null)
}

locals {
  subnets = [for s in azurerm_subnet.subnet : s]
  subnets_name_id_map = {
    for index, subnet in local.subnets :
    subnet.name => subnet.id
  }
}
