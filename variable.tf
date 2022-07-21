variable "organization" {
	description = "Terraform Cloud Organization"
  type = string
}

variable "workspace" {
	description = "Terraform Cloud Workspace to create"
	type = string
}

variable "snyk_url" {
	description = "Snyk URL obtained from Snyk UI"
  type = string
}

variable "snyk_hmac" {
	description = "Snyk HMAC obtained from Snyk UI"
  type = string
}
