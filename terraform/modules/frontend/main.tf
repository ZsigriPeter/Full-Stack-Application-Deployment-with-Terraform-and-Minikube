resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "${var.project_name}-frontend"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "${var.project_name}-frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "${var.project_name}-frontend"
        }
      }

      spec {
        restart_policy = "Always"
        container {
          name  = "frontend"
          image = var.frontend_image

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "frontend" {
  metadata {
    name = "${var.project_name}-frontend-service"
  }
  spec {
    selector = {
      app = "${var.project_name}-frontend"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}