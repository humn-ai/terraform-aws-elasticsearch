resource "aws_elasticsearch_domain_saml_options" "example" {
  domain_name = var.domain_name
  saml_options {
    enabled = var.enabled
    idp {
      entity_id        = var.entity_id
      metadata_content = file(var.metadata_content_file)
    }
    master_backend_role     = var.master_backend_role
    master_user_name        = var.master_user_name
    roles_key               = var.roles_key
    session_timeout_minutes = var.session_timeout_minutes
    subject_key             = var.subject_key
  }
}
