resource "aws_launch_template" "app" {
  name_prefix   = "app-template"
  image_id      = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "App-Launch-Template"
    }
  )
}


resource "aws_autoscaling_group" "app" {
  name = "app-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id
  ]

  target_group_arns = [
    aws_lb_target_group.app.arn
  ]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "App-Server"
    propagate_at_launch = true
  }
}
