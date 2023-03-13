resource "aws_lb" "test" {
  name               = "main-lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.main-sg.id]
  subnets            = [aws_subnet.public1.id,aws_subnet.public2.id]
  }
  
  resource "aws_lb_target_group" "alb-main" {
  name        = "lb-main"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.main-vpc.id
}