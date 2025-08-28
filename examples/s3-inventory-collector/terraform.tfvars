# Example configuration for S3 Inventory Collector Module

# AWS Region
aws_region = "us-east-2"

# Collector bucket name (must be globally unique)
collector_bucket_name = "nvisionx-s3-inventory-collector"

# List of AWS account IDs that will send inventory data
source_account_ids = [
  "285358649488"
]

# Environment
environment = "production"

# Retention period for inventory files (in days)
inventory_retention_days = 90