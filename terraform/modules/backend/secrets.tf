resource "kubernetes_secret" "backend" {
  metadata {
    name = "${var.project_name}-backend-secrets"
  }

  data = {
    EMAIL_BACKEND       = var.email_backend
    EMAIL_HOST          = var.email_host
    EMAIL_PORT          = var.email_port
    EMAIL_HOST_USER     = var.email_host_user
    EMAIL_HOST_PASSWORD = var.email_host_password
    EMAIL_USE_TLS       = var.email_use_tls
    EMAIL_USE_SSL       = var.email_use_ssl
    DEFAULT_FROM_EMAIL  = var.default_from_email
  }
}