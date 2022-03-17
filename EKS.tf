module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "18.10.2"

  cluster_name                    = "Cops-eks-Cluster"
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = false
  vpc_id     = aws_vpc.eks-vpc.id
  subnet_ids = [aws_subnet.Private-1.id, aws_subnet.Private-2.id]

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  self_managed_node_group_defaults = {
    instance_type                          = "t2.micro",
    update_launch_template_default_version = true
    iam_role_additional_policies           = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  }


  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size              = 50
    instance_types         = ["t2.micro"]
    #vpc_security_group_ids = [aws_security_group.additional.id]
  }

}