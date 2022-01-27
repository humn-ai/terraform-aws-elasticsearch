# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-ELASTICSEARCH-SAML
# -----------------------------------------------------------------------------

variable "enabled" {
  type        = bool
  default     = false
  description = "Whether SAML authentication is enabled."
}

variable "domain_name" {
  type        = string
  default     = null
  description = "Name of the ES domain."
}

variable "entity_id" {
  type        = string
  default     = null
  description = "The unique Entity ID of the application in SAML Identity Provider."
}

variable "metadata_content_file" {
  type        = string
  default     = null
  description = "The XML file which contain the Metadata of the SAML application."
}

variable "master_backend_role" {
  type        = string
  default     = null
  description = "This backend role from the SAML IdP receives full permissions to the cluster, equivalent to a new master user."
}

variable "master_user_name" {
  type        = string
  default     = null
  description = "This username from the SAML IdP receives full permissions to the cluster, equivalent to a new master user."
}

variable "roles_key" {
  type        = string
  default     = null
  description = "Element of the SAML assertion to use for backend roles. Default is roles."
}

variable "session_timeout_minutes" {
  type        = number
  default     = 60
  description = "Duration of a session in minutes after a user logs in."
}

variable "subject_key" {
  type        = string
  default     = null
  description = "Element of the SAML assertion to use for username. Default is NameID."
}

