resource "aws_nat_gateway" "NATGW" {
  allocation_id = aws_eip.NGW_EIP.id
  subnet_id     = aws_subnet.Private-1.id

  tags = {
    Name = "NAT Gateway"
  }
}

