variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the ASG"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the EC2 instances"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

variable "db_endpoint" {
  description = "RDS database endpoint"
  type        = string
}