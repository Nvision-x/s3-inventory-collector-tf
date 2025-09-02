output "inventory_buckets" {
  description = "All inventory collector buckets information"
  value       = module.s3_inventory_collector.inventory_collector_buckets
}

output "bucket_names" {
  description = "Bucket names by region"
  value       = module.s3_inventory_collector.bucket_names_by_region
}

output "bucket_arns" {
  description = "Bucket ARNs by region"
  value       = module.s3_inventory_collector.bucket_arns_by_region
}