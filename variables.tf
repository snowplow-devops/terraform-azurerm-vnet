variable "name" {
  description = "A name which will be pre-pended to the resources created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy the vNet into"
  type        = string
}

variable "address_space" {
  description = "The root CIDR range to be used for the vNet deployment"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "A list of public subnets inside the vNet"
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [
    {
      name           = "collector-agw1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "iglu-agw1"
      address_prefix = "10.0.2.0/24"
    },
    {
      name           = "pipeline1"
      address_prefix = "10.0.20.0/24"
    },
    {
      name           = "iglu1"
      address_prefix = "10.0.21.0/24"
    },
    {
      name           = "iglu-vmss1"
      address_prefix = "10.0.22.0/24"
    }
  ]
}

variable "subnet_service_endpoints" {
  type = map(any)
  default = {
    iglu1 = ["Microsoft.Storage"]
  }
  description = "A map of subnet name to service endpoints to add to the subnet."
}

variable "subnet_delegations" {
  type = map(any)
  default = {
    iglu1 = {
      name         = "PostgreSQL"
      service_name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
  description = "A map of subnet name to delegation configuration."
}

variable "tags" {
  description = "The tags to append to this resource"
  default     = {}
  type        = map(string)
}
