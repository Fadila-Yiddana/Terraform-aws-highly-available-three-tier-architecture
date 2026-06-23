# Terraform Configuration

This folder contains the Terraform code used to define the AWS Highly Available Three-Tier Architecture.

## Purpose

The Terraform configuration demonstrates Infrastructure as Code (IaC) principles by provisioning AWS networking, security, compute, and database resources using reusable and version-controlled code.

## Terraform Files

### provider.tf

Configures:

* Terraform version requirements
* AWS provider settings
* AWS deployment region

### variables.tf

Defines reusable input variables including:

* AWS Region
* Project Name
* VPC CIDR
* EC2 Instance Type
* Database Configuration

### terraform.tfvars

Stores values assigned to Terraform variables.

### main.tf

Contains infrastructure resources including:

* Amazon VPC
* Public Subnets
* Private Application Subnets
* Private Database Subnets
* Internet Gateway
* Route Tables
* Security Groups
* Application Load Balancer
* Target Group
* Listener
* Launch Template
* Auto Scaling Group
* DB Subnet Group
* Amazon RDS Multi-AZ

### outputs.tf

Will contain Terraform outputs such as:

* VPC ID
* ALB DNS Name
* RDS Endpoint
* Subnet IDs

## Architecture Alignment

The Terraform code is designed to implement the architecture shown in the project diagram and follows AWS best practices for:

* High Availability
* Security
* Scalability
* Infrastructure as Code

## Current Status

✅ Provider Configuration

✅ VPC and Subnets

✅ Internet Gateway

✅ Route Tables

✅ Security Groups

✅ Application Load Balancer

✅ Auto Scaling Group

🔄 Amazon RDS Multi-AZ

🔄 Route 53 Integration Planned

🔄 CloudFront Integration Planned

## Notes

This project is currently focused on architecture design and Terraform development.

Infrastructure deployment will be performed later in a cloud sandbox environment to avoid unnecessary AWS costs.
