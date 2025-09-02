output "inventory_collector_buckets" {
  description = "Map of all inventory collector buckets by region"
  value = merge(
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
    } : {}
  )
}

output "bucket_names_by_region" {
  description = "Map of bucket names by region"
  value = merge(
    contains(var.regions, "us-east-1") ? {
      "us-east-1" = module.inventory_collector_us_east_1[0].bucket_name
    } : {},
    contains(var.regions, "us-east-2") ? {
      "us-east-2" = module.inventory_collector_us_east_2[0].bucket_name
    } : {},
    contains(var.regions, "us-west-1") ? {
      "us-west-1" = module.inventory_collector_us_west_1[0].bucket_name
    } : {},
    contains(var.regions, "us-west-2") ? {
      "us-west-2" = module.inventory_collector_us_west_2[0].bucket_name
    } : {}
  )
}

output "bucket_arns_by_region" {
  description = "Map of bucket ARNs by region"
  value = merge(
    contains(var.regions, "us-east-1") ? {
      "us-east-1" = module.inventory_collector_us_east_1[0].bucket_arn
    } : {},
    contains(var.regions, "us-east-2") ? {
      "us-east-2" = module.inventory_collector_us_east_2[0].bucket_arn
    } : {},
    contains(var.regions, "us-west-1") ? {
      "us-west-1" = module.inventory_collector_us_west_1[0].bucket_arn
    } : {},
    contains(var.regions, "us-west-2") ? {
      "us-west-2" = module.inventory_collector_us_west_2[0].bucket_arn
    } : {}
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