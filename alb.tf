#Creating External LoadBalancer

resource "aws_lb" "external-elb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets = [aws_subnet.public-subnet-1a.id,
  aws_subnet.public-subnet-1b.id]

}

resource "aws_lb_target_group" "external-elb" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demovpc.id

}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.demoinstance.id
  port             = 80
  depends_on = [
    aws_instance.demoinstance
  ]

}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.demoinstance2.id
  port             = 80
  depends_on = [
    aws_instance.demoinstance2
  ]

}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }

}
