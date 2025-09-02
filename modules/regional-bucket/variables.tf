variable "region" {
  description = "AWS region for the inventory collector bucket"
  type        = string
}

variable "collector_bucket_prefix" {
  description = "Prefix for the S3 collector bucket name (will be suffixed with region)"
  type        = string
}

variable "organization_id" {
  description = "AWS Organization ID that will be allowed to send inventory data to this bucket"
  type        = string
}

variable "policy_access_mode" {
  description = "Access mode for the bucket policy: 'organization' for full org access or 'accounts' for specific account access"
  type        = string
  default     = "organization"
}

variable "allowed_account_ids" {
  description = "List of AWS account IDs allowed to send inventory data (only used when policy_access_mode is 'accounts')"
  type        = list(string)
  default     = []
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