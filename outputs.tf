output "VPC_ip_range" {
  value       = aws_vpc.main.cidr_block
  description = "IP range of VPC"
}

output "Pvivate1_subnet_ip" {
  value = aws_subnet.public1.cidr_block

}

output "Pvivate2_subnet_ip" {
  value = aws_subnet.public2.cidr_block

}

output "Public1_subnet_ip_range" {
  value = aws_subnet.private1.cidr_block

}

output "Public2_subnet_ip_range" {
  value = aws_subnet.private2.cidr_block

}

output "SG_ingress_from_port" {
  value = one(aws_security_group.main-sg.ingress).from_port
}

output "SG_ingress_to_port" {
  value = one(aws_security_group.main-sg.ingress).to_port
}

output "EIP1_public_ip" {
  value = aws_eip.eip1.public_ip
}

output "EIP1_private_ip" {
  value = aws_eip.eip1.private_ip
}

output "EIP2_public_ip" {
 value = aws_eip.eip2.public_ip

}

output "EIP2_private_ip" {
  value = aws_eip.eip2.private_ip
}

output "NAT_public1_public_ip" {
  value = aws_nat_gateway.public1-nat-gw.public_ip
}

output "NAT_public2_public_ip" {
  value = aws_nat_gateway.public2-nat-gw.public_ip
}

output "NAT_public1_private_ip" {
  value = aws_nat_gateway.public1-nat-gw.private_ip
}

output "NAT_public2_private_ip" {
  value = aws_nat_gateway.public2-nat-gw.private_ip
}