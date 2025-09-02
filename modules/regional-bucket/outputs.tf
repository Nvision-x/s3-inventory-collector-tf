output "bucket_id" {
  description = "The ID of the S3 inventory collector bucket"
  value       = aws_s3_bucket.inventory_collector.id
}

output "bucket_arn" {
  description = "The ARN of the S3 inventory collector bucket"
  value       = aws_s3_bucket.inventory_collector.arn
}

output "bucket_region" {
  description = "The region of the S3 inventory collector bucket"
  value       = var.region
}

output "bucket_name" {
  description = "The name of the S3 inventory collector bucket"
  value       = aws_s3_bucket.inventory_collector.bucket
}