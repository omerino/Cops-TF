
resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.eks-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NATGW.id
  }
  tags = {
    Name       = "Private_RT"
    TF_Managed = "True"
  }
}

resource "aws_route_table_association" "private_rt1" {
  subnet_id      = aws_subnet.Private-1.id
  route_table_id = aws_route_table.Private_RT.id
  depends_on = [
    aws_route_table.Private_RT
  ]
}

resource "aws_route_table_association" "private_rt2" {
  subnet_id      = aws_subnet.Private-2.id
  route_table_id = aws_route_table.Private_RT.id
  depends_on = [
    aws_route_table.Private_RT
  ]
}

