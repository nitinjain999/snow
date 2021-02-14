resource "helm_release" "mysql" {
  name       = "mysql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mysql"
  version    = "8.2.3"
  namespace  = "snow"
  create_namespace = "true"
  set {
    name  = "auth.database"
    value = var.name
  }

  set {
    name  = "auth.username"
    value = var.username
  }

  set {
    name  = "auth.password"
    value = var.password
  }
}
resource "helm_release" "myapp" {
  name  = "myapp"
  depends_on = [helm_release.mysql]
  namespace = "snow"
  chart = "./myapp_chart/myapp"
  set {
    name = "service.type"
    value = "LoadBalancer"
  }
  set {
    name = "secret.name"
    value = var.name
  }
  set {
    name = "secret.user"
    value = var.username
  }
  set {
    name = "secret.password"
    value = var.password
  }
  set {
    name = "secret.endpoint"
    value = var.endpoint
  }
  set {
    name = "image.tag"
    value = "v7"
  }
  set {
    name = "image.repository"
    value = "nitinjain08/snow"
  }
}
