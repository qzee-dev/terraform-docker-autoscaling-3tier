resource "aws_autoscaling_group" "api_asg" {
  desired_capacity    = 2
  max_size            = 6
  min_size            = 2
  vpc_zone_identifier = var.private_subnets
  target_group_arns   = [aws_lb_target_group.api_tg.arn]

  launch_template {
    id      = aws_launch_template.api_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "docker-api"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_scaling" {
  name                   = "cpu-scaling-policy"
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 60
  }
}
