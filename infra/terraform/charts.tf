resource "helm_release" "mysql" {
  name       = "mysql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mysql"
  version    = "8.2.3"
  namespace  = "snow"
  create_namespace = "true"
  set {
    name  = "auth.database"
    value = "test_db"
  }

  set {
    name  = "auth.username"
    value = "test_db_username"
  }

  set {
    name  = "auth.password"
    value = "test_db_password"
  }
}
resource "helm_release" "myapp" {
  name  = "myapp"
  depends_on = [helm_release.mysql]
  namespace = "snow"
  chart = "../myapp_chart/myapp"
  set {
    name = "service.type"
    value = "LoadBalancer"
  }
  set {
    name = "secret.name"
    value = "test_db"
  }
  set {
    name = "secret.user"
    value = "test_db_username"
  }
  set {
    name = "secret.password"
    value = "test_db_password"
  }
  set {
    name = "secret.endpoint"
    value = "mysql.snow"
  }
}

