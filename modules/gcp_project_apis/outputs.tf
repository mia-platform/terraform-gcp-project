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

output "project_id" {
  value = element(
    concat(local.project_ids, [var.project_id]),
  0)
  description = "The full project id"
}

output "activated_apis" {
  value       = local.enabled_apis
  description = "The APIs activated on the project"
}

output "total_activated_apis" {
  value       = length(local.enabled_apis)
  description = "The total amount of enabled APIs"
}
