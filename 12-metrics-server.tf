resource "helm_release" "metrics_server" {
    name = "metrics-server"

    repository = "https://kubernetes-sigs.github.io/metrics-server"
    chart      = "metrics-server"
    version    = "3.8.1"
    namespace  = "kube-system"

    values = [file("${path.module}/values/metrics-server.yaml")]

    depends_on = [aws_eks_node_group.general]

    timeout = 600 # Increased to 10 minutes
}