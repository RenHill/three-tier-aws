output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.loadbalancer.alb_dns_name
}

output "route53_nameservers" {
  description = "Nameservers for the Route 53 hosted zone"
  value       = module.dns.nameservers
}

output "rds_endpoint" {
  description = "Endpoint of the RDS PostgreSQL instance"
  value       = module.database.db_endpoint
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}