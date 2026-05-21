output "nameservers" {
  description = "Nameservers for the hosted zone"
  value       = aws_route53_zone.main.name_servers
}

output "zone_id" {
  description = "ID of the hosted zone"
  value       = aws_route53_zone.main.zone_id
}