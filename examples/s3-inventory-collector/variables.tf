variable "aws_region" {
  description = "AWS region where the collector bucket will be created"
  type        = string
  default     = "eu-central-1"
}

variable "collector_bucket_name" {
  description = "Name of the S3 collector bucket"
  type        = string
  default     = "s3-inventory-collector-example"
}

variable "source_account_ids" {
  description = "List of AWS account IDs that will send inventory data to this bucket"
  type        = list(string)
  # Example: ["111111111111", "222222222222"]
}

variable "environment" {
  description = "Environment tag for the resources"
  type        = string
  default     = "production"
}

variable "inventory_retention_days" {
  description = "Number of days to retain inventory files before deletion"
  type        = number
  default     = 90
}