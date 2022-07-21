terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.33.0"
    }
  }
}

data "tfe_organization" "my_org" {
  name = var.organization
}

resource "tfe_organization_run_task" "org_runtask" {
  category     = "task"
  organization = data.tfe_organization.my_org.name
  url          = var.snyk_url
  hmac_key     = var.snyk_hmac
  name         = "Snyk_integration_by_provider"
  enabled      = true
}

resource "tfe_workspace" "ws" {
  name         = "snyk_runtask_integration_demo"
  organization = data.tfe_organization.my_org.name
  tag_names    = ["test", "demo", "snyk"]
}

resource "tfe_workspace_run_task" "example" {
  workspace_id      = tfe_workspace.ws.id
  task_id           = tfe_organization_run_task.org_runtask.id
  enforcement_level = "advisory"
}


