# Terraform module Netlify site

This repository contains the Terraform module code to manage a Netlify site.

## Usage

```hcl
module "netlify_site" {
  source  = "nephosolutions/site/netlify"
  version = "1.0.0"
  # insert the 3 required variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Providers

| Name | Version |
|------|---------|
| github | n/a |
| netlify | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_domain | Custom domain of the site, must be configured using a CNAME in accordance with Netlify's docs. (e.g. www.example.com) | `any` | `null` | no |
| github | The configuration of your Github organization and repository | <pre>object({<br>    organization = string<br>    repository   = string<br>  })</pre> | n/a | yes |
| name | Name of your site on Netlify (e.g. mysite.netlify.app) | `any` | n/a | yes |
| production\_branch | The Git branch from which production deploys will be build | `string` | `"master"` | no |

## Outputs

| Name | Description |
|------|-------------|
| custom\_domain | Custom domain of the site, must be configured using a CNAME in accordance with Netlify's docs. (e.g. www.example.com) |
| name | Name of your site on Netlify (e.g. mysite.netlify.app) |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
