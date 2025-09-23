resource "kubernetes_deployment" "backend" {
  metadata {
    name = "${var.project_name}-backend"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "${var.project_name}-backend"
      }
    }
    template {
      metadata {
        labels = {
          app = "${var.project_name}-backend"
        }
      }
      spec {
        restart_policy = "Always"
        container {
          name  = "backend"
          image = var.backend_image

          port {
            container_port = 8000
          }

          env_from {
            secret_ref {
              name = "${var.project_name}-backend-secrets"
            }
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "backend" {
  metadata {
    name = "${var.project_name}-backend-service"
  }
  spec {
    selector = {
      app = "${var.project_name}-backend"
    }
    port {
      port        = 8000
      target_port = 8000
    }
    type = "ClusterIP"
  }
}



