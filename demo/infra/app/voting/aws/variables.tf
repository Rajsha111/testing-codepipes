variable "aws_region" {
  default = "us-east-1"
   type    = string
}

variable "cluster-name" {
  default = "codepipes-cdn-eks-demo"
  type    = string
}

variable "node-group-name" {
  default = "codepipes-cdn-node-group"
  type    = string
}

variable "role-eks-demo-node" {
  default = "codepipes-cdn-eks-demo-node"
  type    = string
}

variable "vpc-eks-tag-name" {
  default = "codepipes-cdn-eks-demo-tag-name"
  type    = string
}

variable "cluster_ipv4_cidr" {
  description = "The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR."
  default = "10.0.0.0/16"
  type    = string
}



variable "map_additional_iam_roles" {
  description = "Additional IAM roles to add to `config-map-aws-auth` ConfigMap"

  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

