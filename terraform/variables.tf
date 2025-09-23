variable "project_name" {
  default = "tac"
  type = string
}

variable "email_host_user" {
  description = "Email host user for backend secrets"
  type        = string
}
variable "frontend_image" {
  description = "Docker image for the frontend service"
  type        = string
}

variable "backend_image" {
  description = "Docker image for the backend service"
  type        = string
}
variable "email_backend" {
  description = "Email backend for backend secrets"
  type        = string
}
variable "email_host" {
  description = "Email host for backend secrets"
  type        = string
}
variable "email_port" {
  description = "Email port for backend secrets"
  type        = string
}
variable "email_host_password" {
  description = "Email host password for backend secrets"
  type        = string
}
variable "email_use_tls" {
  description = "Email use TLS for backend secrets"
  type        = string
}
variable "email_use_ssl" {
  description = "Email use SSL for backend secrets"
  type        = string
}
variable "default_from_email" {
  description = "Default from email for backend secrets"
  type        = string
}