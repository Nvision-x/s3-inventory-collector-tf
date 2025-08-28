output "collector_bucket_name" {
  value       = aws_s3_bucket.inventory_collector.id
  description = "The name of the collector bucket"
}

output "collector_bucket_arn" {
  value       = aws_s3_bucket.inventory_collector.arn
  description = "The ARN of the collector bucket"
}

output "collector_bucket_domain_name" {
  value       = aws_s3_bucket.inventory_collector.bucket_domain_name
  description = "The bucket domain name of the collector bucket"
}

output "collector_bucket_regional_domain_name" {
  value       = aws_s3_bucket.inventory_collector.bucket_regional_domain_name
  description = "The regional domain name of the collector bucket"
}

output "collector_account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "The AWS account ID where the collector bucket resides"
}