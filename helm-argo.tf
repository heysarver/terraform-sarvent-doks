# resource "helm_release" "argo" {
#   name = "argocd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   namespace  = "argocd"
#   version    = "5.46.8"

#   values = [jsonencode({
#     someKey = "someValue"
#   })]

#   # set {
#   #   name  = "someKey"
#   #   value = "someValue"
#   # }

#   # set_sensitive {
#   #   name  = "someOtherKey"
#   #   value = "someOtherValue"
#   # } 
# }
