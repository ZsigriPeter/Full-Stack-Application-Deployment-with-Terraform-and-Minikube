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

          volume_mount {
            name       = "firebase-key"
            mount_path = "/app/firebase_key.json"
            sub_path   = "firebase_key.json"
          }
          env_from {
            secret_ref {
              name = "${var.project_name}-backend-secrets"
            }
          }
        }
         volume {
          name = "firebase-key"
          secret {
            secret_name = kubernetes_secret.firebase_key.metadata[0].name
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

resource "kubernetes_secret" "firebase_key" {
  metadata {
    name      = "firebase-key"
    namespace = "default"
  }

  data = {
    "firebase_key.json" = file("${path.module}/firebase_key.json")
  }
}


