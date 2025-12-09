aws_region = "us-east-1"
aws_az = "us-east-1a"
project_name = "terraform-ai"

# Make sure to choose globally unique S3 bucket name
s3_bucket_name = "terraform-ai-state-bucket-123456789"

dynamodb_table_name = "terraform-ai-tf-locks"

# Restrict SSH in production; default is open for demo
allowed_ssh_cidr = "0.0.0.0/0"
