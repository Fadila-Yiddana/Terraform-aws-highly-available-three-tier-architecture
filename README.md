# Terraform AWS Highly Available Three-Tier Architecture

A Terraform project demonstrating the design and implementation of a highly available, multi-tier AWS architecture following Infrastructure as Code (IaC) best practices.

---

## Project Overview

This project demonstrates how Terraform can be used to provision a highly available three-tier architecture on AWS.

The infrastructure separates the presentation, application, and database layers into dedicated tiers distributed across multiple Availability Zones to improve scalability, fault tolerance, and resilience.

The project follows AWS Well-Architected design principles and demonstrates enterprise cloud infrastructure commonly used in production environments.

---

## Architecture

The diagram below illustrates the high-level architecture of the AWS highly available three-tier application, showing how traffic flows securely through the presentation, application, and database layers across multiple Availability Zones.

![Terraform AWS Highly Available Three-Tier Architecture](./diagrams/highly-available-three-tier-architecture.png)

*Figure: Highly available AWS three-tier architecture deployed across multiple Availability Zones using Terraform.*


---

## Architecture Flow

Client

↓

Amazon CloudFront

↓

Amazon Route 53

↓

Application Load Balancer

↓

Auto Scaling Group (Amazon EC2)

↓

Amazon RDS Multi-AZ

---

## AWS Services Used

| AWS Service               | Purpose                                                |
| ------------------------- | ------------------------------------------------------ |
| Amazon VPC                | Isolates the network environment                       |
| Public & Private Subnets  | Separates internet-facing and internal resources       |
| Internet Gateway          | Provides internet connectivity                         |
| Application Load Balancer | Distributes incoming traffic                           |
| Auto Scaling Group        | Automatically scales EC2 instances                     |
| Amazon EC2                | Hosts the application layer                            |
| Amazon RDS Multi-AZ       | Provides highly available relational database services |
| Amazon Route 53           | DNS management                                         |
| Amazon CloudFront         | Global content delivery                                |
| Security Groups           | Controls network access                                |
| Terraform                 | Infrastructure as Code provisioning                    |

---

## Network Design

| Resource             | CIDR Block  |
| -------------------- | ----------- |
| VPC                  | 10.0.0.0/16 |
| Public Subnet A      | 10.0.1.0/24 |
| Public Subnet B      | 10.0.2.0/24 |
| Private App Subnet A | 10.0.3.0/24 |
| Private App Subnet B | 10.0.4.0/24 |
| Private DB Subnet A  | 10.0.5.0/24 |
| Private DB Subnet B  | 10.0.6.0/24 |

---

## Security Design

* Application Load Balancer accepts HTTP (80) and HTTPS (443) traffic.
* EC2 instances accept traffic only from the Application Load Balancer.
* Amazon RDS accepts database traffic only from the application layer.
* Network isolation is achieved using public and private subnets.
* Security Groups enforce least-privilege access between tiers.

---

## High Availability Features

* Multi-AZ deployment
* Public and private subnet architecture
* Application Load Balancer
* Auto Scaling Group
* Amazon RDS Multi-AZ
* Fault-tolerant network design
* Infrastructure as Code using Terraform

---

## Repository Structure

```text

├── diagrams/
│   └── highly-available-three-tier-architecture.png
terraform/
├── alb.tf
├── autoscaling.tf
├── data.tf
├── internet_gateway.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── rds.tf
├── route_tables.tf
├── security_groups.tf
├── subnets.tf
├── terraform.tfvars
├── variables.tf
├── versions.tf
└── vpc.tf
├── .gitignore
└── README.md
```

---

## Project Status

| Component                  | Status                                  |
| -------------------------- | --------------------------------------- |
| Repository Created         | ✅                                       |
| Architecture Diagram       | ✅                                       |
| Terraform Configuration    | ✅                                       |
| VPC Design                 | ✅                                       |
| Networking Configuration   | ✅                                       |
| Security Groups            | ✅                                       |
| Application Load Balancer  | ✅                                       |
| Auto Scaling Configuration | ✅                                       |
| Amazon RDS Multi-AZ Design | ✅                                       |
| Terraform Validation       | ✅                                       |
| Deployment                 | ✅ Successfully deployed and validated in AWS training environment |

---

## Skills Demonstrated

* Infrastructure as Code (Terraform)
* Terraform Variables
* Terraform Outputs
* Terraform Data Sources
* Terraform Locals
* Terraform State Management
* Modular Terraform File Organization
* AWS Networking
* Amazon VPC
* Auto Scaling
* Application Load Balancer
* Amazon RDS
* Cloud Security
* AWS Well-Architected Framework

---

## Future Improvements

* Add AWS WAF
* Implement CI/CD with GitHub Actions
* Enable centralized logging with Amazon CloudWatch
* Configure AWS Backup
* Add monitoring and alerting
* Refactor infrastructure into reusable Terraform modules

---


## Prerequisites


* Terraform v1.5 or later
* AWS CLI configured
* AWS account with appropriate IAM permissions
* Git

---

## Deployment Notes

This project was developed as part of my hands-on cloud engineering portfolio using Terraform and AWS.

The infrastructure was successfully deployed and tested in a cloud training environment during my AWS training at AmaliTech Ghana. As the training lab environments were temporary, the deployed resources were terminated after the lab sessions expired.

The Terraform configuration is deployment-ready and can be provisioned in any AWS account with valid credentials by running:

git clone <https://github.com/Fadila-Yiddana/Terraform-aws-highly-available-three-tier-architecture/blob/main/README.md>

cd terraform

terraform init

terraform plan

terraform apply
```
