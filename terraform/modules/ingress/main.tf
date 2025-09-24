resource "kubernetes_ingress_v1" "app" {
  metadata {
    name = "${var.project_name}-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/?(.*)"
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

        path {
          path      = "/api/?(.*)"
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
