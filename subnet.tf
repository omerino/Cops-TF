resource "aws_subnet" "Private-1" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = var.private_subnet-1
  availability_zone = "eu-west-2a"

  tags = {
    Name       = "Private Subnet-1"
    TF_Managed = "True"
  }
  depends_on = [aws_vpc.eks-vpc]
}

resource "aws_subnet" "Private-2" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = var.private_subnet-2
  availability_zone = "eu-west-2b"
  tags = {
    Name       = "Private Subnet-2"
    TF_Managed = "True"
  }
  depends_on = [aws_vpc.eks-vpc]
}


