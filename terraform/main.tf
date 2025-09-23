module "backend" {
  source = "./modules/backend"

    project_name        = var.project_name
    backend_image      = var.backend_image
    email_backend      = var.email_backend
    email_host        = var.email_host
    email_port        = var.email_port
    email_host_user     = var.email_host_user
    email_host_password   = var.email_host_password
    email_use_tls      = var.email_use_tls
    email_use_ssl      = var.email_use_ssl
    default_from_email   = var.default_from_email
}

module "frontend" {
  source = "./modules/frontend"

    project_name   = var.project_name
    frontend_image = var.frontend_image
}