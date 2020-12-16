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

// Install SSH deployment key into the Github repository
resource "github_repository_deploy_key" "netlify" {
  title      = "Netlify ${var.custom_domain}"
  repository = var.github.repository
  key        = netlify_deploy_key.github.public_key
  read_only  = true
}

// Trigger deploys on Netlify for Github repository changes
resource "github_repository_webhook" "netlify_build_trigger" {
  repository = var.github.repository

  events = [
    "delete",
    "push",
    "pull_request"
  ]

  configuration {
    content_type = "json"
    insecure_ssl = false
    url          = "https://api.netlify.com/hooks/github"
  }
}

// SSH deployment key used by Netlify to checkout the Github repository
resource "netlify_deploy_key" "github" {
}

resource "netlify_site" "managed" {
  name          = var.name
  custom_domain = var.custom_domain

  repo {
    provider      = "github"
    repo_path     = "${var.github.organization}/${var.github.repository}"
    repo_branch   = var.production_branch
    deploy_key_id = netlify_deploy_key.github.id
  }

  depends_on = [
    github_repository_deploy_key.netlify
  ]
}
