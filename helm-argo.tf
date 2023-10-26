resource "helm_release" "argo" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata.0.name
  version    = "5.46.8"

  depends_on = [
    kubernetes_namespace.argocd
  ]

  values = [jsonencode({
    configs.secret.argocdServerAdminPassword = var.argo_admin_password_bcrypt
  })]

  # set {
  #   name  = "someKey"
  #   value = "someValue"
  # }

  # set_sensitive {
  #   name  = "someOtherKey"
  #   value = "someOtherValue"
  # } 
}
