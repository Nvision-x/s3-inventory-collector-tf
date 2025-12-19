output "inventory_collector_buckets" {
  description = "Map of all inventory collector buckets by region"
  value = merge(
    # US Regions
    contains(var.regions, "us-east-1") ? {
      "us-east-1" = {
        bucket_id   = module.inventory_collector_us_east_1[0].bucket_id
        bucket_arn  = module.inventory_collector_us_east_1[0].bucket_arn
        bucket_name = module.inventory_collector_us_east_1[0].bucket_name
        region      = module.inventory_collector_us_east_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "us-east-2") ? {
      "us-east-2" = {
        bucket_id   = module.inventory_collector_us_east_2[0].bucket_id
        bucket_arn  = module.inventory_collector_us_east_2[0].bucket_arn
        bucket_name = module.inventory_collector_us_east_2[0].bucket_name
        region      = module.inventory_collector_us_east_2[0].bucket_region
      }
    } : {},
    contains(var.regions, "us-west-1") ? {
      "us-west-1" = {
        bucket_id   = module.inventory_collector_us_west_1[0].bucket_id
        bucket_arn  = module.inventory_collector_us_west_1[0].bucket_arn
        bucket_name = module.inventory_collector_us_west_1[0].bucket_name
        region      = module.inventory_collector_us_west_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "us-west-2") ? {
      "us-west-2" = {
        bucket_id   = module.inventory_collector_us_west_2[0].bucket_id
        bucket_arn  = module.inventory_collector_us_west_2[0].bucket_arn
        bucket_name = module.inventory_collector_us_west_2[0].bucket_name
        region      = module.inventory_collector_us_west_2[0].bucket_region
      }
    } : {},
    # EU Regions
    contains(var.regions, "eu-west-1") ? {
      "eu-west-1" = {
        bucket_id   = module.inventory_collector_eu_west_1[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_west_1[0].bucket_arn
        bucket_name = module.inventory_collector_eu_west_1[0].bucket_name
        region      = module.inventory_collector_eu_west_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-west-2") ? {
      "eu-west-2" = {
        bucket_id   = module.inventory_collector_eu_west_2[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_west_2[0].bucket_arn
        bucket_name = module.inventory_collector_eu_west_2[0].bucket_name
        region      = module.inventory_collector_eu_west_2[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-west-3") ? {
      "eu-west-3" = {
        bucket_id   = module.inventory_collector_eu_west_3[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_west_3[0].bucket_arn
        bucket_name = module.inventory_collector_eu_west_3[0].bucket_name
        region      = module.inventory_collector_eu_west_3[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-central-1") ? {
      "eu-central-1" = {
        bucket_id   = module.inventory_collector_eu_central_1[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_central_1[0].bucket_arn
        bucket_name = module.inventory_collector_eu_central_1[0].bucket_name
        region      = module.inventory_collector_eu_central_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-central-2") ? {
      "eu-central-2" = {
        bucket_id   = module.inventory_collector_eu_central_2[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_central_2[0].bucket_arn
        bucket_name = module.inventory_collector_eu_central_2[0].bucket_name
        region      = module.inventory_collector_eu_central_2[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-north-1") ? {
      "eu-north-1" = {
        bucket_id   = module.inventory_collector_eu_north_1[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_north_1[0].bucket_arn
        bucket_name = module.inventory_collector_eu_north_1[0].bucket_name
        region      = module.inventory_collector_eu_north_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-south-1") ? {
      "eu-south-1" = {
        bucket_id   = module.inventory_collector_eu_south_1[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_south_1[0].bucket_arn
        bucket_name = module.inventory_collector_eu_south_1[0].bucket_name
        region      = module.inventory_collector_eu_south_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "eu-south-2") ? {
      "eu-south-2" = {
        bucket_id   = module.inventory_collector_eu_south_2[0].bucket_id
        bucket_arn  = module.inventory_collector_eu_south_2[0].bucket_arn
        bucket_name = module.inventory_collector_eu_south_2[0].bucket_name
        region      = module.inventory_collector_eu_south_2[0].bucket_region
      }
    } : {},
    # Asia Pacific Regions
    contains(var.regions, "ap-south-1") ? {
      "ap-south-1" = {
        bucket_id   = module.inventory_collector_ap_south_1[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_south_1[0].bucket_arn
        bucket_name = module.inventory_collector_ap_south_1[0].bucket_name
        region      = module.inventory_collector_ap_south_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-south-2") ? {
      "ap-south-2" = {
        bucket_id   = module.inventory_collector_ap_south_2[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_south_2[0].bucket_arn
        bucket_name = module.inventory_collector_ap_south_2[0].bucket_name
        region      = module.inventory_collector_ap_south_2[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-northeast-1") ? {
      "ap-northeast-1" = {
        bucket_id   = module.inventory_collector_ap_northeast_1[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_northeast_1[0].bucket_arn
        bucket_name = module.inventory_collector_ap_northeast_1[0].bucket_name
        region      = module.inventory_collector_ap_northeast_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-northeast-2") ? {
      "ap-northeast-2" = {
        bucket_id   = module.inventory_collector_ap_northeast_2[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_northeast_2[0].bucket_arn
        bucket_name = module.inventory_collector_ap_northeast_2[0].bucket_name
        region      = module.inventory_collector_ap_northeast_2[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-northeast-3") ? {
      "ap-northeast-3" = {
        bucket_id   = module.inventory_collector_ap_northeast_3[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_northeast_3[0].bucket_arn
        bucket_name = module.inventory_collector_ap_northeast_3[0].bucket_name
        region      = module.inventory_collector_ap_northeast_3[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-southeast-1") ? {
      "ap-southeast-1" = {
        bucket_id   = module.inventory_collector_ap_southeast_1[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_southeast_1[0].bucket_arn
        bucket_name = module.inventory_collector_ap_southeast_1[0].bucket_name
        region      = module.inventory_collector_ap_southeast_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-southeast-2") ? {
      "ap-southeast-2" = {
        bucket_id   = module.inventory_collector_ap_southeast_2[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_southeast_2[0].bucket_arn
        bucket_name = module.inventory_collector_ap_southeast_2[0].bucket_name
        region      = module.inventory_collector_ap_southeast_2[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-southeast-3") ? {
      "ap-southeast-3" = {
        bucket_id   = module.inventory_collector_ap_southeast_3[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_southeast_3[0].bucket_arn
        bucket_name = module.inventory_collector_ap_southeast_3[0].bucket_name
        region      = module.inventory_collector_ap_southeast_3[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-southeast-4") ? {
      "ap-southeast-4" = {
        bucket_id   = module.inventory_collector_ap_southeast_4[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_southeast_4[0].bucket_arn
        bucket_name = module.inventory_collector_ap_southeast_4[0].bucket_name
        region      = module.inventory_collector_ap_southeast_4[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-southeast-5") ? {
      "ap-southeast-5" = {
        bucket_id   = module.inventory_collector_ap_southeast_5[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_southeast_5[0].bucket_arn
        bucket_name = module.inventory_collector_ap_southeast_5[0].bucket_name
        region      = module.inventory_collector_ap_southeast_5[0].bucket_region
      }
    } : {},
    contains(var.regions, "ap-east-1") ? {
      "ap-east-1" = {
        bucket_id   = module.inventory_collector_ap_east_1[0].bucket_id
        bucket_arn  = module.inventory_collector_ap_east_1[0].bucket_arn
        bucket_name = module.inventory_collector_ap_east_1[0].bucket_name
        region      = module.inventory_collector_ap_east_1[0].bucket_region
      }
    } : {},
    # Canada Regions
    contains(var.regions, "ca-central-1") ? {
      "ca-central-1" = {
        bucket_id   = module.inventory_collector_ca_central_1[0].bucket_id
        bucket_arn  = module.inventory_collector_ca_central_1[0].bucket_arn
        bucket_name = module.inventory_collector_ca_central_1[0].bucket_name
        region      = module.inventory_collector_ca_central_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "ca-west-1") ? {
      "ca-west-1" = {
        bucket_id   = module.inventory_collector_ca_west_1[0].bucket_id
        bucket_arn  = module.inventory_collector_ca_west_1[0].bucket_arn
        bucket_name = module.inventory_collector_ca_west_1[0].bucket_name
        region      = module.inventory_collector_ca_west_1[0].bucket_region
      }
    } : {},
    # South America Regions
    contains(var.regions, "sa-east-1") ? {
      "sa-east-1" = {
        bucket_id   = module.inventory_collector_sa_east_1[0].bucket_id
        bucket_arn  = module.inventory_collector_sa_east_1[0].bucket_arn
        bucket_name = module.inventory_collector_sa_east_1[0].bucket_name
        region      = module.inventory_collector_sa_east_1[0].bucket_region
      }
    } : {},
    # Middle East Regions
    contains(var.regions, "me-south-1") ? {
      "me-south-1" = {
        bucket_id   = module.inventory_collector_me_south_1[0].bucket_id
        bucket_arn  = module.inventory_collector_me_south_1[0].bucket_arn
        bucket_name = module.inventory_collector_me_south_1[0].bucket_name
        region      = module.inventory_collector_me_south_1[0].bucket_region
      }
    } : {},
    contains(var.regions, "me-central-1") ? {
      "me-central-1" = {
        bucket_id   = module.inventory_collector_me_central_1[0].bucket_id
        bucket_arn  = module.inventory_collector_me_central_1[0].bucket_arn
        bucket_name = module.inventory_collector_me_central_1[0].bucket_name
        region      = module.inventory_collector_me_central_1[0].bucket_region
      }
    } : {},
    # Africa Regions
    contains(var.regions, "af-south-1") ? {
      "af-south-1" = {
        bucket_id   = module.inventory_collector_af_south_1[0].bucket_id
        bucket_arn  = module.inventory_collector_af_south_1[0].bucket_arn
        bucket_name = module.inventory_collector_af_south_1[0].bucket_name
        region      = module.inventory_collector_af_south_1[0].bucket_region
      }
    } : {},
    # Israel Regions
    contains(var.regions, "il-central-1") ? {
      "il-central-1" = {
        bucket_id   = module.inventory_collector_il_central_1[0].bucket_id
        bucket_arn  = module.inventory_collector_il_central_1[0].bucket_arn
        bucket_name = module.inventory_collector_il_central_1[0].bucket_name
        region      = module.inventory_collector_il_central_1[0].bucket_region
      }
    } : {}
  )
}

output "bucket_names_by_region" {
  description = "Map of bucket names by region"
  value = merge(
    # US Regions
    contains(var.regions, "us-east-1") ? { "us-east-1" = module.inventory_collector_us_east_1[0].bucket_name } : {},
    contains(var.regions, "us-east-2") ? { "us-east-2" = module.inventory_collector_us_east_2[0].bucket_name } : {},
    contains(var.regions, "us-west-1") ? { "us-west-1" = module.inventory_collector_us_west_1[0].bucket_name } : {},
    contains(var.regions, "us-west-2") ? { "us-west-2" = module.inventory_collector_us_west_2[0].bucket_name } : {},
    # EU Regions
    contains(var.regions, "eu-west-1") ? { "eu-west-1" = module.inventory_collector_eu_west_1[0].bucket_name } : {},
    contains(var.regions, "eu-west-2") ? { "eu-west-2" = module.inventory_collector_eu_west_2[0].bucket_name } : {},
    contains(var.regions, "eu-west-3") ? { "eu-west-3" = module.inventory_collector_eu_west_3[0].bucket_name } : {},
    contains(var.regions, "eu-central-1") ? { "eu-central-1" = module.inventory_collector_eu_central_1[0].bucket_name } : {},
    contains(var.regions, "eu-central-2") ? { "eu-central-2" = module.inventory_collector_eu_central_2[0].bucket_name } : {},
    contains(var.regions, "eu-north-1") ? { "eu-north-1" = module.inventory_collector_eu_north_1[0].bucket_name } : {},
    contains(var.regions, "eu-south-1") ? { "eu-south-1" = module.inventory_collector_eu_south_1[0].bucket_name } : {},
    contains(var.regions, "eu-south-2") ? { "eu-south-2" = module.inventory_collector_eu_south_2[0].bucket_name } : {},
    # Asia Pacific Regions
    contains(var.regions, "ap-south-1") ? { "ap-south-1" = module.inventory_collector_ap_south_1[0].bucket_name } : {},
    contains(var.regions, "ap-south-2") ? { "ap-south-2" = module.inventory_collector_ap_south_2[0].bucket_name } : {},
    contains(var.regions, "ap-northeast-1") ? { "ap-northeast-1" = module.inventory_collector_ap_northeast_1[0].bucket_name } : {},
    contains(var.regions, "ap-northeast-2") ? { "ap-northeast-2" = module.inventory_collector_ap_northeast_2[0].bucket_name } : {},
    contains(var.regions, "ap-northeast-3") ? { "ap-northeast-3" = module.inventory_collector_ap_northeast_3[0].bucket_name } : {},
    contains(var.regions, "ap-southeast-1") ? { "ap-southeast-1" = module.inventory_collector_ap_southeast_1[0].bucket_name } : {},
    contains(var.regions, "ap-southeast-2") ? { "ap-southeast-2" = module.inventory_collector_ap_southeast_2[0].bucket_name } : {},
    contains(var.regions, "ap-southeast-3") ? { "ap-southeast-3" = module.inventory_collector_ap_southeast_3[0].bucket_name } : {},
    contains(var.regions, "ap-southeast-4") ? { "ap-southeast-4" = module.inventory_collector_ap_southeast_4[0].bucket_name } : {},
    contains(var.regions, "ap-southeast-5") ? { "ap-southeast-5" = module.inventory_collector_ap_southeast_5[0].bucket_name } : {},
    contains(var.regions, "ap-east-1") ? { "ap-east-1" = module.inventory_collector_ap_east_1[0].bucket_name } : {},
    # Canada Regions
    contains(var.regions, "ca-central-1") ? { "ca-central-1" = module.inventory_collector_ca_central_1[0].bucket_name } : {},
    contains(var.regions, "ca-west-1") ? { "ca-west-1" = module.inventory_collector_ca_west_1[0].bucket_name } : {},
    # South America Regions
    contains(var.regions, "sa-east-1") ? { "sa-east-1" = module.inventory_collector_sa_east_1[0].bucket_name } : {},
    # Middle East Regions
    contains(var.regions, "me-south-1") ? { "me-south-1" = module.inventory_collector_me_south_1[0].bucket_name } : {},
    contains(var.regions, "me-central-1") ? { "me-central-1" = module.inventory_collector_me_central_1[0].bucket_name } : {},
    # Africa Regions
    contains(var.regions, "af-south-1") ? { "af-south-1" = module.inventory_collector_af_south_1[0].bucket_name } : {},
    # Israel Regions
    contains(var.regions, "il-central-1") ? { "il-central-1" = module.inventory_collector_il_central_1[0].bucket_name } : {}
  )
}

output "bucket_arns_by_region" {
  description = "Map of bucket ARNs by region"
  value = merge(
    # US Regions
    contains(var.regions, "us-east-1") ? { "us-east-1" = module.inventory_collector_us_east_1[0].bucket_arn } : {},
    contains(var.regions, "us-east-2") ? { "us-east-2" = module.inventory_collector_us_east_2[0].bucket_arn } : {},
    contains(var.regions, "us-west-1") ? { "us-west-1" = module.inventory_collector_us_west_1[0].bucket_arn } : {},
    contains(var.regions, "us-west-2") ? { "us-west-2" = module.inventory_collector_us_west_2[0].bucket_arn } : {},
    # EU Regions
    contains(var.regions, "eu-west-1") ? { "eu-west-1" = module.inventory_collector_eu_west_1[0].bucket_arn } : {},
    contains(var.regions, "eu-west-2") ? { "eu-west-2" = module.inventory_collector_eu_west_2[0].bucket_arn } : {},
    contains(var.regions, "eu-west-3") ? { "eu-west-3" = module.inventory_collector_eu_west_3[0].bucket_arn } : {},
    contains(var.regions, "eu-central-1") ? { "eu-central-1" = module.inventory_collector_eu_central_1[0].bucket_arn } : {},
    contains(var.regions, "eu-central-2") ? { "eu-central-2" = module.inventory_collector_eu_central_2[0].bucket_arn } : {},
    contains(var.regions, "eu-north-1") ? { "eu-north-1" = module.inventory_collector_eu_north_1[0].bucket_arn } : {},
    contains(var.regions, "eu-south-1") ? { "eu-south-1" = module.inventory_collector_eu_south_1[0].bucket_arn } : {},
    contains(var.regions, "eu-south-2") ? { "eu-south-2" = module.inventory_collector_eu_south_2[0].bucket_arn } : {},
    # Asia Pacific Regions
    contains(var.regions, "ap-south-1") ? { "ap-south-1" = module.inventory_collector_ap_south_1[0].bucket_arn } : {},
    contains(var.regions, "ap-south-2") ? { "ap-south-2" = module.inventory_collector_ap_south_2[0].bucket_arn } : {},
    contains(var.regions, "ap-northeast-1") ? { "ap-northeast-1" = module.inventory_collector_ap_northeast_1[0].bucket_arn } : {},
    contains(var.regions, "ap-northeast-2") ? { "ap-northeast-2" = module.inventory_collector_ap_northeast_2[0].bucket_arn } : {},
    contains(var.regions, "ap-northeast-3") ? { "ap-northeast-3" = module.inventory_collector_ap_northeast_3[0].bucket_arn } : {},
    contains(var.regions, "ap-southeast-1") ? { "ap-southeast-1" = module.inventory_collector_ap_southeast_1[0].bucket_arn } : {},
    contains(var.regions, "ap-southeast-2") ? { "ap-southeast-2" = module.inventory_collector_ap_southeast_2[0].bucket_arn } : {},
    contains(var.regions, "ap-southeast-3") ? { "ap-southeast-3" = module.inventory_collector_ap_southeast_3[0].bucket_arn } : {},
    contains(var.regions, "ap-southeast-4") ? { "ap-southeast-4" = module.inventory_collector_ap_southeast_4[0].bucket_arn } : {},
    contains(var.regions, "ap-southeast-5") ? { "ap-southeast-5" = module.inventory_collector_ap_southeast_5[0].bucket_arn } : {},
    contains(var.regions, "ap-east-1") ? { "ap-east-1" = module.inventory_collector_ap_east_1[0].bucket_arn } : {},
    # Canada Regions
    contains(var.regions, "ca-central-1") ? { "ca-central-1" = module.inventory_collector_ca_central_1[0].bucket_arn } : {},
    contains(var.regions, "ca-west-1") ? { "ca-west-1" = module.inventory_collector_ca_west_1[0].bucket_arn } : {},
    # South America Regions
    contains(var.regions, "sa-east-1") ? { "sa-east-1" = module.inventory_collector_sa_east_1[0].bucket_arn } : {},
    # Middle East Regions
    contains(var.regions, "me-south-1") ? { "me-south-1" = module.inventory_collector_me_south_1[0].bucket_arn } : {},
    contains(var.regions, "me-central-1") ? { "me-central-1" = module.inventory_collector_me_central_1[0].bucket_arn } : {},
    # Africa Regions
    contains(var.regions, "af-south-1") ? { "af-south-1" = module.inventory_collector_af_south_1[0].bucket_arn } : {},
    # Israel Regions
    contains(var.regions, "il-central-1") ? { "il-central-1" = module.inventory_collector_il_central_1[0].bucket_arn } : {}
  )
}

output "account_id" {
  description = "AWS Account ID where the buckets are created"
  value       = data.aws_caller_identity.current.account_id
}

output "regions_deployed" {
  description = "List of regions where inventory collector buckets are deployed"
  value       = var.regions
}
