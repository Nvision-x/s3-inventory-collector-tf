terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3_inventory_collector" {
  
  source = "../.."

  regions                 = ["us-east-1", "us-east-2"]
  collector_bucket_prefix = "nvisionx-s3-inventory-new"
  organization_id         = "o-a4mmb8jobe"

  # Policy access mode configuration
  # Option 1: Organization-wide access (default)
  # policy_access_mode = "organization"
  
  # Option 2: Restrict to specific accounts (uncomment below and comment above)
  policy_access_mode = "accounts"
  allowed_account_ids = [
    "285358649488",
    "311141546999"
  ]

  inventory_retention_days           = 90
  noncurrent_version_expiration_days = 7
  enable_versioning                  = true
  enable_lifecycle                   = true
  encryption_algorithm               = "AES256"

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Purpose     = "S3 Inventory Collection"
  }
}