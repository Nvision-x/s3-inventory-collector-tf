terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

data "aws_caller_identity" "current" {}

locals {
  regions_set = toset(var.regions)
}

module "inventory_collector_us_east_1" {
  count    = contains(var.regions, "us-east-1") ? 1 : 0
  source   = "./modules/regional-bucket"
  
  providers = {
    aws = aws.us_east_1
  }

  region                             = "us-east-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_us_east_2" {
  count    = contains(var.regions, "us-east-2") ? 1 : 0
  source   = "./modules/regional-bucket"
  
  providers = {
    aws = aws.us_east_2
  }

  region                             = "us-east-2"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_us_west_1" {
  count    = contains(var.regions, "us-west-1") ? 1 : 0
  source   = "./modules/regional-bucket"
  
  providers = {
    aws = aws.us_west_1
  }

  region                             = "us-west-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_us_west_2" {
  count    = contains(var.regions, "us-west-2") ? 1 : 0
  source   = "./modules/regional-bucket"
  
  providers = {
    aws = aws.us_west_2
  }

  region                             = "us-west-2"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

provider "aws" {
  alias  = "us_west_1"
  region = "us-west-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}