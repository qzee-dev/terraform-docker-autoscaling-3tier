# terraform-docker-autoscaling-3tier

[![Terraform](https://img.shields.io/badge/Terraform-1.5-blue.svg)](https://www.terraform.io/) 
[![Docker](https://img.shields.io/badge/Docker-API-green.svg)](https://www.docker.com/) 
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange.svg)](https://aws.amazon.com/)

A **production-ready, 3-tier architecture** on AWS using **Terraform**, **Docker**, **EC2 Auto Scaling**, **ALB**, and **RDS**.  
This project demonstrates modern DevOps practices, infrastructure as code (IaC), and horizontal scalability of containerized applications.

---

## Table of Contents

1. [Architecture Overview](#architecture-overview)  
2. [Technologies Used](#technologies-used)  
3. [Features](#features)  
4. [Prerequisites](#prerequisites)  
5. [Deployment](#deployment)  
6. [Project Structure](#project-structure)  
7. [Configuration](#configuration)  
8. [Usage](#usage)  
9. [Scaling and Security](#scaling-and-security)  
10. [Contributing](#contributing)  
11. [License](#license)  

---

## Architecture Overview




### Tiers:

1. **Presentation Layer:** ALB handles client traffic and distributes it to EC2 instances.  
2. **Application Layer:** EC2 instances run Docker containers for the API, scaling horizontally using Auto Scaling Groups.  
3. **Data Layer:** RDS MySQL database in private subnets ensures persistence and secure access from the application layer only.  

---

## Technologies Used

- **Cloud Provider:** AWS  
- **Infrastructure as Code:** Terraform  
- **Containers:** Docker  
- **Compute:** Amazon EC2 (Auto Scaling Group)  
- **Load Balancing:** Application Load Balancer (ALB)  
- **Database:** Amazon RDS MySQL  

---

## Features

- 3-Tier Architecture: Presentation → Application → Data  
- Infrastructure as Code with Terraform  
- Containerized API running on EC2 instances  
- Auto Scaling Group (2–6 EC2 instances)  
- ALB distributes traffic across EC2 instances  
- RDS in private subnets for secure database access  
- Horizontal scaling and high availability  

---

## Prerequisites

- AWS account with IAM permissions  
- Terraform >= 1.5  
- Docker image for your API  
- SSH key pair for EC2 access  
- Knowledge of VPC, subnets, and security groups  

---

## Deployment

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/terraform-docker-autoscaling-3tier.git
cd terraform-docker-autoscaling-3tier

Edit terraform.tfvars:
aws_region      = "us-east-1"
vpc_id          = "vpc-xxxxxx"
public_subnets  = ["subnet-public1","subnet-public2"]
private_subnets = ["subnet-private1","subnet-private2"]
ami_id          = "ami-xxxxxxxx"
key_name        = "my-keypair"
db_username     = "admin"
db_password     = "StrongPass123!"


terraform init
terraform plan
terraform apply
