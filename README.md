[![Release][release-image]][release] [![CI][ci-image]][ci] [![License][license-image]][license] [![Registry][registry-image]][registry]

# terraform-azurerm-vnet

A Terraform module for deploying a basic Virtual Network deployment for a Snowplow pipeline. The default configurations creates 4 subnets to isolate different parts of the deployment logically and the default quick-start depends on this setup.

_NOTE_: If you wish to have more control over the deployment its recommended to instead [leverage the offical vNet module from Azurerm](https://github.com/Azure/terraform-azurerm-vnet/tree/main) which has exposed all available options and can be used for a more security focused deployment.

## Usage

```hcl
module "pipeline_vnet" {
  source = "snowplow-devops/vnet/azurerm"

  name                = "pipeline-vnet"
  resource_group_name = "pipeline"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | A name which will be pre-pended to the resources created | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to deploy the vNet into | `string` | n/a | yes |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The root CIDR range to be used for the vNet deployment | `string` | `"10.0.0.0/16"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of public subnets inside the vNet | <pre>list(object({<br>    name           = string<br>    address_prefix = string<br>  }))</pre> | <pre>[<br>  {<br>    "address_prefix": "10.0.1.0/24",<br>    "name": "collector-agw1"<br>  },<br>  {<br>    "address_prefix": "10.0.10.0/24",<br>    "name": "igluserver-agw1"<br>  },<br>  {<br>    "address_prefix": "10.0.11.0/24",<br>    "name": "igluserver-db1"<br>  },<br>  {<br>    "address_prefix": "10.0.20.0/24",<br>    "name": "public1"<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to append to this resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the vNet |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the vNet |
| <a name="output_vnet_subnets"></a> [vnet\_subnets](#output\_vnet\_subnets) | The IDs of subnets created inside the vNet |
| <a name="output_vnet_subnets_name_id"></a> [vnet\_subnets\_name\_id](#output\_vnet\_subnets\_name\_id) | Can be queried subnet ID by subnet name by using lookup(module.vnet.vnet\_subnets\_name\_id, subnet1) |

# Copyright and license

The Azurerm VNet project is Copyright 2023-2023 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[release]: https://github.com/snowplow-devops/terraform-azurerm-vnet/releases/latest
[release-image]: https://img.shields.io/github/v/release/snowplow-devops/terraform-azurerm-vnet

[ci]: https://github.com/snowplow-devops/terraform-azurerm-vnet/actions?query=workflow%3Aci
[ci-image]: https://github.com/snowplow-devops/terraform-azurerm-vnet/workflows/ci/badge.svg

[license]: https://www.apache.org/licenses/LICENSE-2.0
[license-image]: https://img.shields.io/badge/license-Apache--2-blue.svg?style=flat

[registry]: https://registry.terraform.io/modules/snowplow-devops/vnet/azurerm/latest
[registry-image]: https://img.shields.io/static/v1?label=Terraform&message=Registry&color=7B42BC&logo=terraform
