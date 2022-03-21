resource "aws_security_group" "elasticache-sg" {
  name        = "elasticache-sg"
  description = "Allow all inbound traffic"
  vpc_id      = var.eks_vpc 
  

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds" {
  name        = "rds-${var.sandbox_id}_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
