[README.md](https://github.com/user-attachments/files/28094248/README.md)
<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# AWS Three-Tier Architecture with Terraform

**Project Link:** [View Project](https://learn.nextwork.org/projects/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0)

**Author:** shanmhill@gmail.com  
**Email:** shanmhill@gmail.com

---

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_5770kkzh)

## Deploying a Production-Grade Three-Tier AWS Architecture

### Project overview and goals

In this project, I'm building a three-tier AWS architecture with DNS routing, load balancing, and a managed database using Terraform so that I can demonstrate load balancers, application servers, and databases all working together.

### Wiring modules together and deploying

In this step, I'm writing the root main.tf so that I can connect all the modules together.

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_5770kkzh)

### Live ALB DNS output

My ALB DNS name is three-tier-demo-alb-1979672106.us-east-1.elb.amazonaws.com.

## Setting Up the Modular Terraform Project Structure

### Project structure and tooling

In this step, I'm setting up the directory layout for my four Terraform modules so that I can write the root configuration files.

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_yx0clsrx)

### Default tagging strategy

The default_tags block ensures that every resource automatically has the Project, ManagedBy, and Environment tags.

## Building the Networking Module with Multi-Tier Segmentation

### VPC, subnets, and routing design

In this step, I'm building the network that the rest of my infrastructure will exist in.

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_0ysn4fam)

### Least-privilege security groups across tiers

The security groups enforce least-privilege by only allowing the ALB to accept HTTP from the internet, the application tier to only accept traffic from the ALB, and the database to only accept connections from the application tier.

## Provisioning the RDS PostgreSQL Database in Isolated Subnets

### Database module setup

In this step, I'm setting up an Amazon RDS PostgreSQL database so that I can store data.

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_jdx8o6ui)

### Private database access design

The database is not publicly accessible because "publicly_accessible = false" ensures no public IP is assigned. The database is reachable only from within the VPC.

## Configuring the Application Load Balancer with Health Checks

### Load balancer module overview

In this step, I'm setting up an Application Load Balancer so that I can distribute incoming HTTP requests across targets in my private subnets.

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_0o5flxrb)

### Target group health check behavior

The health check monitors if targets are healthy or unhealthy. If a target fails 3 times (unhealthy_threshold = 3), the ALB stops sending traffic to it.

## Routing Traffic with Route 53 DNS and ALB Alias Records

### DNS module and hosted zone setup

In this step, I'm setting up a DNS module using Route 53 so that I can have a human-readable domain name instead of an auto-generated AWS hostname.

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_kn3v3hyi)

### Alias record pointing to the ALB

The alias block maps my domain to the ALB by using an AWS alias record.

## Extending with Auto Scaling EC2 Instances Behind the ALB

![Image](https://learn.nextwork.org/soothed_turquoise_calm_dewberry/uploads/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0_nwp5rm9c)

### Auto Scaling Group health check and instance replacement

In this project extension, the ASG uses ALB health checks with a grace period of 120 seconds to give Apache time to start.

## Reflections and Key Takeaways

### Tools and concepts mastered

Designed a multi-AZ VPC with proper network segmentation separating public, private, and database tiers using security groups enforcing least-privilege access between each layer.

Provisioned an Application Load Balancer, an RDS PostgreSQL database, and Route 53 DNS with an alias record routing traffic through a complete three-tier architecture.

Structured Terraform code into reusable modules (networking, database, loadbalancer, dns).

Added an Auto Scaling Group with EC2 instances serving live traffic through the ALB, proving end-to-end connectivity across all three tiers.

### Time and challenges

This project took me approximately 2-3 hours. 

I did this project to learn how to set up a load balancer and auto scaling.

---

*Built with [NextWork](https://learn.nextwork.org) - [View this project](https://learn.nextwork.org/projects/ab780f6a-bc97-4417-b07d-cc2ca42ff4e0)*
