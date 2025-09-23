variable "project_name" {
  default = "tac"
  type = string
}

variable "frontend_image" {
  description = "Docker image for the frontend service"
  type        = string
}