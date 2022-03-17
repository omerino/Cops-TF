variable "vpc_cidr" {
  type    = string
  default = "172.24.0.0/16"
}

variable "private_subnet-1" {
  type    = string
  default = "172.24.0.0/20"
}

variable "private_subnet-2" {
  type    = string
  default = "172.24.16.0/20"
}
variable "eks_cluster" {
  type    = string
  default = "EKS-Cluster-Cops"
}
