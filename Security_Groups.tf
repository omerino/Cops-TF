resource "aws_security_group" "Eks-internal" {
  name        = "Eks-internal"
  description = "Eks-internal"
  vpc_id      = aws_vpc.eks-vpc.id
  tags = {
    Name       = "Eks-internal"
    TF_Managed = "True"
  }

}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["172.24.0.0/16"]
  security_group_id = aws_security_group.Eks-internal.id
  description       = "Allow ssh outbound TFmanged"
}