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
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_eu_central_2" {
  count    = contains(var.regions, "eu-central-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_central_2
  }

  region                             = "eu-central-2"
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

module "inventory_collector_eu_north_1" {
  count    = contains(var.regions, "eu-north-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_north_1
  }

  region                             = "eu-north-1"
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

module "inventory_collector_eu_south_1" {
  count    = contains(var.regions, "eu-south-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_south_1
  }

  region                             = "eu-south-1"
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

module "inventory_collector_eu_south_2" {
  count    = contains(var.regions, "eu-south-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.eu_south_2
  }

  region                             = "eu-south-2"
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
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ap_south_2" {
  count    = contains(var.regions, "ap-south-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_south_2
  }

  region                             = "ap-south-2"
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

module "inventory_collector_ap_northeast_1" {
  count    = contains(var.regions, "ap-northeast-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_northeast_1
  }

  region                             = "ap-northeast-1"
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

module "inventory_collector_ap_northeast_2" {
  count    = contains(var.regions, "ap-northeast-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_northeast_2
  }

  region                             = "ap-northeast-2"
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

module "inventory_collector_ap_northeast_3" {
  count    = contains(var.regions, "ap-northeast-3") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_northeast_3
  }

  region                             = "ap-northeast-3"
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

module "inventory_collector_ap_southeast_1" {
  count    = contains(var.regions, "ap-southeast-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_1
  }

  region                             = "ap-southeast-1"
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

module "inventory_collector_ap_southeast_2" {
  count    = contains(var.regions, "ap-southeast-2") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_2
  }

  region                             = "ap-southeast-2"
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

module "inventory_collector_ap_southeast_3" {
  count    = contains(var.regions, "ap-southeast-3") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_3
  }

  region                             = "ap-southeast-3"
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

module "inventory_collector_ap_southeast_4" {
  count    = contains(var.regions, "ap-southeast-4") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_4
  }

  region                             = "ap-southeast-4"
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

module "inventory_collector_ap_southeast_5" {
  count    = contains(var.regions, "ap-southeast-5") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_southeast_5
  }

  region                             = "ap-southeast-5"
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

module "inventory_collector_ap_east_1" {
  count    = contains(var.regions, "ap-east-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ap_east_1
  }

  region                             = "ap-east-1"
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
  policy_access_mode                 = var.policy_access_mode
  allowed_account_ids                = var.allowed_account_ids
  inventory_retention_days           = var.inventory_retention_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  enable_versioning                  = var.enable_versioning
  enable_lifecycle                   = var.enable_lifecycle
  encryption_algorithm               = var.encryption_algorithm
  tags                               = var.tags
}

module "inventory_collector_ca_west_1" {
  count    = contains(var.regions, "ca-west-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.ca_west_1
  }

  region                             = "ca-west-1"
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
# Middle East Regions
# =============================================================================

module "inventory_collector_me_south_1" {
  count    = contains(var.regions, "me-south-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.me_south_1
  }

  region                             = "me-south-1"
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

module "inventory_collector_me_central_1" {
  count    = contains(var.regions, "me-central-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.me_central_1
  }

  region                             = "me-central-1"
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

# =============================================================================
# Africa Regions
# =============================================================================

module "inventory_collector_af_south_1" {
  count    = contains(var.regions, "af-south-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.af_south_1
  }

  region                             = "af-south-1"
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

# =============================================================================
# Israel Regions
# =============================================================================

module "inventory_collector_il_central_1" {
  count    = contains(var.regions, "il-central-1") ? 1 : 0
  source   = "./modules/regional-bucket"

  providers = {
    aws = aws.il_central_1
  }

  region                             = "il-central-1"
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

# =============================================================================
# Provider Aliases - US Regions
# =============================================================================

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

# =============================================================================
# Provider Aliases - EU Regions
# =============================================================================

provider "aws" {
  alias  = "eu_west_1"
  region = "eu-west-1"
}

provider "aws" {
  alias  = "eu_west_2"
  region = "eu-west-2"
}

provider "aws" {
  alias  = "eu_west_3"
  region = "eu-west-3"
}

provider "aws" {
  alias  = "eu_central_1"
  region = "eu-central-1"
}

provider "aws" {
  alias  = "eu_central_2"
  region = "eu-central-2"
}

provider "aws" {
  alias  = "eu_north_1"
  region = "eu-north-1"
}

provider "aws" {
  alias  = "eu_south_1"
  region = "eu-south-1"
}

provider "aws" {
  alias  = "eu_south_2"
  region = "eu-south-2"
}

# =============================================================================
# Provider Aliases - Asia Pacific Regions
# =============================================================================

provider "aws" {
  alias  = "ap_south_1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "ap_south_2"
  region = "ap-south-2"
}

provider "aws" {
  alias  = "ap_northeast_1"
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "ap_northeast_2"
  region = "ap-northeast-2"
}

provider "aws" {
  alias  = "ap_northeast_3"
  region = "ap-northeast-3"
}

provider "aws" {
  alias  = "ap_southeast_1"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "ap_southeast_2"
  region = "ap-southeast-2"
}

provider "aws" {
  alias  = "ap_southeast_3"
  region = "ap-southeast-3"
}

provider "aws" {
  alias  = "ap_southeast_4"
  region = "ap-southeast-4"
}

provider "aws" {
  alias  = "ap_southeast_5"
  region = "ap-southeast-5"
}

provider "aws" {
  alias  = "ap_east_1"
  region = "ap-east-1"
}

# =============================================================================
# Provider Aliases - Canada Regions
# =============================================================================

provider "aws" {
  alias  = "ca_central_1"
  region = "ca-central-1"
}

provider "aws" {
  alias  = "ca_west_1"
  region = "ca-west-1"
}

# =============================================================================
# Provider Aliases - South America Regions
# =============================================================================

provider "aws" {
  alias  = "sa_east_1"
  region = "sa-east-1"
}

# =============================================================================
# Provider Aliases - Middle East Regions
# =============================================================================

provider "aws" {
  alias  = "me_south_1"
  region = "me-south-1"
}

provider "aws" {
  alias  = "me_central_1"
  region = "me-central-1"
}

# =============================================================================
# Provider Aliases - Africa Regions
# =============================================================================

provider "aws" {
  alias  = "af_south_1"
  region = "af-south-1"
}

# =============================================================================
# Provider Aliases - Israel Regions
# =============================================================================

provider "aws" {
  alias  = "il_central_1"
  region = "il-central-1"
}

