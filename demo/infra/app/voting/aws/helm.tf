terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.1.2"
    }
  }
}

resource "time_sleep" "wait_30_second" {
    depends_on = [
    aws_eks_cluster.demo,
  ]

  create_duration = "30s"
}


data "aws_eks_cluster_auth" "cluster_auth" {
  name = aws_eks_cluster.demo.name
  depends_on = [time_sleep.wait_30_second]
}

provider "helm" {
  # Configuration options
  kubernetes {
    host                   = aws_eks_cluster.demo.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.demo.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster_auth.token
  }
}

resource helm_release aws_alb_controller {
  name       = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = aws_eks_cluster.demo.name
  }

  depends_on = [
    aws_eks_node_group.demo,
  ]
}