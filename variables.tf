variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "aws_az" {
  description = "Availability zone for subnet"
  type        = string
  default     = "us-east-1a"
}

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "terraform-ai"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for storing state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for state locking"
  type        = string
}
