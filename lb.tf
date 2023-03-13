resource "aws_lb" "main-lb" {
  name               = "main-lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.main-sg.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]
}

resource "aws_lb_target_group" "main-tg" {
  name        = "main-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main-vpc.id

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.main-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2_attach" {
  target_group_arn = aws_lb_target_group.main-tg.arn
  target_id        = aws_instance.webserver.id
}
