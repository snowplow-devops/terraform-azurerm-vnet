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
      name           = "igluserver-agw1"
      address_prefix = "10.0.10.0/24"
    },
    {
      name           = "igluserver-db1"
      address_prefix = "10.0.11.0/24"
    },
    {
      name           = "public1"
      address_prefix = "10.0.20.0/24"
    }
  ]
}

variable "tags" {
  description = "The tags to append to this resource"
  default     = {}
  type        = map(string)
}
