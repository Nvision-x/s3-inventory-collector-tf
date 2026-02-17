terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
      configuration_aliases = [
        aws.us_east_1,
        aws.us_east_2,
        aws.us_west_1,
        aws.us_west_2,
        aws.eu_west_1,
        aws.eu_west_2,
        aws.eu_west_3,
        aws.eu_central_1,
        aws.eu_north_1,
        aws.ap_south_1,
        aws.ap_northeast_1,
        aws.ap_northeast_2,
        aws.ap_northeast_3,
        aws.ap_southeast_1,
        aws.ap_southeast_2,
        aws.ca_central_1,
        aws.sa_east_1,
      ]
    }
  }
}

data "aws_caller_identity" "current" {}

locals {
  regions_set = toset(var.regions)
}

# =============================================================================
# US Regions
# =============================================================================

module "inventory_collector_us_east_1" {
  count    = contains(var.regions, "us-east-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.us_east_1
  }

  region                             = "us-east-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
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
  bucket_owner_account_id            = var.bucket_owner_account_id
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
  bucket_owner_account_id            = var.bucket_owner_account_id
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
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

# =============================================================================
# EU Regions
# =============================================================================

module "inventory_collector_eu_west_1" {
  count    = contains(var.regions, "eu-west-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_west_1
  }

  region                             = "eu-west-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_eu_west_2" {
  count    = contains(var.regions, "eu-west-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_west_2
  }

  region                             = "eu-west-2"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_eu_west_3" {
  count    = contains(var.regions, "eu-west-3") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_west_3
  }

  region                             = "eu-west-3"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_eu_central_1" {
  count    = contains(var.regions, "eu-central-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_central_1
  }

  region                             = "eu-central-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_eu_north_1" {
  count    = contains(var.regions, "eu-north-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_north_1
  }

  region                             = "eu-north-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}


# =============================================================================
# Asia Pacific Regions
# =============================================================================

module "inventory_collector_ap_south_1" {
  count    = contains(var.regions, "ap-south-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_south_1
  }

  region                             = "ap-south-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ap_northeast_1" {
  count    = contains(var.regions, "ap-northeast-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_northeast_1
  }

  region                             = "ap-northeast-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ap_northeast_2" {
  count    = contains(var.regions, "ap-northeast-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_northeast_2
  }

  region                             = "ap-northeast-2"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ap_northeast_3" {
  count    = contains(var.regions, "ap-northeast-3") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_northeast_3
  }

  region                             = "ap-northeast-3"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ap_southeast_1" {
  count    = contains(var.regions, "ap-southeast-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_1
  }

  region                             = "ap-southeast-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ap_southeast_2" {
  count    = contains(var.regions, "ap-southeast-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_2
  }

  region                             = "ap-southeast-2"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

# =============================================================================
# Canada Regions
# =============================================================================

module "inventory_collector_ca_central_1" {
  count    = contains(var.regions, "ca-central-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ca_central_1
  }

  region                             = "ca-central-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

# =============================================================================
# South America Regions
# =============================================================================

module "inventory_collector_sa_east_1" {
  count    = contains(var.regions, "sa-east-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.sa_east_1
  }

  region                             = "sa-east-1"
  collector_bucket_prefix            = var.collector_bucket_prefix
  organization_id                    = var.organization_id
  bucket_owner_account_id            = var.bucket_owner_account_id
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}
