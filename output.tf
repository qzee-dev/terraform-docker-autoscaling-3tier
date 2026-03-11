output "alb_dns" {
  value = aws_lb.api_alb.dns_name
}

output "db_endpoint" {
  value = aws_db_instance.api_db.address
}
