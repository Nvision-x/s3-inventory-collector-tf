variable "regions" {
  description = <<-EOT
    List of AWS regions where inventory collector buckets will be created.
    Supported regions:
    - US: us-east-1, us-east-2, us-west-1, us-west-2
    - EU: eu-west-1, eu-west-2, eu-west-3, eu-central-1, eu-north-1
    - Asia Pacific: ap-south-1, ap-northeast-1, ap-northeast-2, ap-northeast-3, ap-southeast-1, ap-southeast-2
    - Canada: ca-central-1
    - South America: sa-east-1
  EOT
  type        = list(string)
  default     = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]
}

variable "collector_bucket_prefix" {
  description = "Prefix for the S3 collector bucket names (will be suffixed with region)"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.collector_bucket_prefix))
    error_message = "Bucket prefix must start and end with a lowercase letter or number, and can contain hyphens."
  }
}

variable "organization_id" {
  description = "AWS Organization ID that will be allowed to send inventory data to these buckets"
  type        = string
}

variable "bucket_owner_account_id" {
  description = "AWS account ID of the bucket owner (used for IAM access in bucket policy). If not set, defaults to the caller's account ID."
  type        = string
  default     = null
}

variable "policy_access_mode" {
  description = "Access mode for the bucket policy: 'organization' for full org access or 'accounts' for specific account access"
  type        = string
  default     = "organization"
  validation {
    condition     = contains(["organization", "accounts"], var.policy_access_mode)
    error_message = "Policy access mode must be either 'organization' or 'accounts'."
  }
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
  description = "Enable versioning for the S3 buckets"
  type        = bool
  default     = true
}

variable "enable_lifecycle" {
  description = "Enable lifecycle rules for the S3 buckets"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "Server-side encryption algorithm to use (AES256 or aws:kms)"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.encryption_algorithm)
    error_message = "Encryption algorithm must be either AES256 or aws:kms."
  }
}

variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
  default     = {}
}