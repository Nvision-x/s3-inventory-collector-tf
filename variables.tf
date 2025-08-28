variable "collector_bucket_name" {
  description = "Name of the S3 collector bucket"
  type        = string
}

variable "source_account_ids" {
  description = "List of AWS account IDs that will send inventory data to this bucket"
  type        = list(string)
}

variable "inventory_retention_days" {
  description = "Number of days to retain inventory files before deletion"
  type        = number
  default     = 90
}

variable "noncurrent_version_expiration_days" {
  description = "Number of days to retain noncurrent object versions"
  type        = number
  default     = 7
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "enable_lifecycle" {
  description = "Enable lifecycle rules for the S3 bucket"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "Server-side encryption algorithm to use (AES256 or aws:kms)"
  type        = string
  default     = "AES256"
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}