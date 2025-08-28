provider "aws" {
  region = var.aws_region
}

module "s3_inventory_collector" {
  source = "../.."

  collector_bucket_name = var.collector_bucket_name
  source_account_ids    = var.source_account_ids
  
  # Optional configurations
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = 7
  enable_versioning                  = true
  enable_lifecycle                   = true
  encryption_algorithm               = "AES256"
  
  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "S3-Inventory"
  }
}

# Outputs
output "collector_bucket_name" {
  value       = module.s3_inventory_collector.collector_bucket_name
  description = "The name of the collector bucket"
}

output "collector_bucket_arn" {
  value       = module.s3_inventory_collector.collector_bucket_arn
  description = "The ARN of the collector bucket"
}

output "collector_account_id" {
  value       = module.s3_inventory_collector.collector_account_id
  description = "The AWS account ID where the collector bucket resides"
}