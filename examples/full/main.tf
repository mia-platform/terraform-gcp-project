/*
  Copyright 2019 Mia srl

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

provider "google" {
  credentials = file(var.credentials_path)
  version     = "~> 2.20"
}

provider "google-beta" {
  credentials = file(var.credentials_path)
  version     = "~> 2.20"
}

provider "random" {
  version = "~> 2"
}

data "google_compute_network" "vpc-shared-network" {
  name    = "shared-vpc"
  project = "shared-vpc-host-project"
}

module "full_project" {
  source          = "../../"
  name            = "full-config-project"
  organization_id = var.organization_id
  billing_account = var.billing_account
  folder_id       = var.folder_id

  activate_apis = ["compute.googleapis.com", "pubsub.googleapis.com"]
  labels = {
    configuration = "full"
    terraform     = "true"
  }

  shared_vpc_project_id  = data.google_compute_network.vpc-shared-network.project
  shared_vpc_subnets_ids = data.google_compute_network.vpc-shared-network.subnetworks_self_links
}
