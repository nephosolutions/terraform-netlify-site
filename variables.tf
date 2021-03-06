# Copyright 2020 NephoSolutions SRL, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "custom_domain" {
  default     = null
  description = "Custom domain of the site, must be configured using a CNAME in accordance with Netlify's docs. (e.g. www.example.com)"
}

variable "github" {
  description = "The configuration of your Github organization and repository"
  type = object({
    organization = string
    repository   = string
  })
}

variable "name" {
  description = "Name of your site on Netlify (e.g. mysite.netlify.app)"
}

variable "production_branch" {
  default     = "master"
  description = "The Git branch from which production deploys will be build"
}
