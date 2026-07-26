output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.compute.alb_dns_name
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.database.rds_endpoint
}