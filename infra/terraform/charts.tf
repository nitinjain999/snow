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
