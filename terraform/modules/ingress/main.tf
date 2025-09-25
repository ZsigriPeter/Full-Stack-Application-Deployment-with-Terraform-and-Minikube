resource "kubernetes_ingress_v1" "app" {
  metadata {
    name = "${var.project_name}-ingress"
  }

  spec {
    rule {
      host = "tac.local" 
      http {
        # Frontend path
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "${var.project_name}-frontend-service"
              port {
                number = 80
              }
            }
          }
        }

        # Backend API path
        path {
          path      = "/api/"
          path_type = "Prefix"

          backend {
            service {
              name = "${var.project_name}-backend-service"
              port {
                number = 8000
              }
            }
          }
        }
      }
    }
  }
}
