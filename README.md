# S3 Inventory Collector - Multi-Region Terraform Module

This Terraform module creates centralized S3 buckets across multiple AWS regions to collect S3 inventory reports from an entire AWS Organization or specific accounts. It's designed for organizations that need to aggregate S3 inventory data for compliance, cost optimization, or data governance purposes.

## 📋 Overview

S3 Inventory provides scheduled reports about objects in your S3 buckets, including metadata, encryption status, and replication status. Since S3 Inventory reports must be delivered to a bucket in the same region as the source bucket, this module automatically creates collector buckets in each specified region with consistent security configurations.

## ✨ Features

- **Multi-Region Support**: Automatically creates inventory collector buckets in up to 4 US regions (us-east-1, us-east-2, us-west-1, us-west-2)
- **Organization-Wide or Account-Specific Access**: Supports collection from entire AWS Organizations or specific account lists
- **Security Best Practices**: 
  - Server-side encryption (AES256 or KMS)
  - Versioning support
  - Public access blocking enabled by default
  - Least-privilege bucket policies
- **Automated Lifecycle Management**: Configurable retention policies for inventory files
- **Modular Architecture**: Uses a reusable sub-module for consistent regional bucket configuration
- **Cost Optimization**: Automatic cleanup of old inventory files and non-current versions

## 🏗 Architecture

```
root module/
├── main.tf                 # Root module with regional deployments
├── variables.tf           # Input variables
├── outputs.tf             # Module outputs
└── modules/
    └── regional-bucket/   # Reusable regional bucket module
        ├── main.tf        # Bucket resources
        ├── variables.tf   # Module variables
        └── outputs.tf     # Module outputs
```

### Resources Created Per Region

Each regional deployment creates:
- 1x S3 Bucket with naming format: `{prefix}-{region}`
- 1x Bucket Versioning Configuration
- 1x Bucket Encryption Configuration
- 1x Public Access Block Configuration
- 1x Bucket Policy (organization or account-based)
- 1x Lifecycle Configuration (optional)

## 📦 Requirements

| Component | Version |
|-----------|---------|
| Terraform | >= 1.0 |
| AWS Provider | >= 4.0 |
| AWS Permissions | S3 bucket creation, policy management |

## 🚀 Usage

### Basic Example - Organization-Wide Access

```hcl
module "s3_inventory_collector" {
  source = "./s3-inventory-collector-tf"
  
  # Deploy to specific regions
  regions = ["us-east-1", "us-west-2"]
  
  # Bucket naming
  collector_bucket_prefix = "my-org-s3-inventory"
  
  # Organization access
  organization_id = "o-1234567890"
  
  # Retention settings
  inventory_retention_days = 90
  
  tags = {
    Environment = "Production"
    Purpose     = "S3 Inventory Collection"
    ManagedBy   = "Terraform"
  }
}
```

### Advanced Example - Specific Accounts Access

```hcl
module "s3_inventory_collector" {
  source = "./s3-inventory-collector-tf"
  
  regions                 = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]
  collector_bucket_prefix = "company-s3-inventory"
  
  # Use account-specific access instead of organization
  policy_access_mode  = "accounts"
  organization_id     = "o-1234567890"  # Still required but not used in policy
  allowed_account_ids = [
    "123456789012",
    "234567890123",
    "345678901234"
  ]
  
  # Lifecycle configuration
  inventory_retention_days           = 60
  noncurrent_version_expiration_days = 7
  enable_versioning                  = true
  enable_lifecycle                   = true
  
  # Encryption
  encryption_algorithm = "aws:kms"
  
  tags = {
    Environment  = "Production"
    CostCenter   = "Security"
    DataClass    = "Metadata"
  }
}
```

### Minimal Example

```hcl
module "s3_inventory_collector" {
  source = "./s3-inventory-collector-tf"
  
  collector_bucket_prefix = "inventory"
  organization_id         = "o-1234567890"
}
```

## 📝 Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `regions` | List of AWS regions where inventory collector buckets will be created | `list(string)` | `["us-east-1", "us-east-2", "us-west-1", "us-west-2"]` | no |
| `collector_bucket_prefix` | Prefix for S3 bucket names (will be suffixed with region). Must start/end with lowercase letter or number, can contain hyphens | `string` | - | **yes** |
| `organization_id` | AWS Organization ID for inventory data collection | `string` | - | **yes** |
| `policy_access_mode` | Access mode: `"organization"` for org-wide or `"accounts"` for specific accounts | `string` | `"organization"` | no |
| `allowed_account_ids` | List of AWS account IDs (only used when policy_access_mode is "accounts") | `list(string)` | `[]` | no |
| `inventory_retention_days` | Number of days to retain inventory files | `number` | `90` | no |
| `noncurrent_version_expiration_days` | Number of days to retain non-current object versions | `number` | `7` | no |
| `enable_versioning` | Enable S3 bucket versioning | `bool` | `true` | no |
| `enable_lifecycle` | Enable lifecycle rules for automatic cleanup | `bool` | `true` | no |
| `encryption_algorithm` | Server-side encryption algorithm (`"AES256"` or `"aws:kms"`) | `string` | `"AES256"` | no |
| `tags` | Map of tags to apply to all resources | `map(string)` | `{}` | no |

## 📤 Outputs

| Name | Description | Example |
|------|-------------|---------|
| `inventory_collector_buckets` | Complete map of all collector buckets with their properties | See structure below |
| `bucket_names_by_region` | Simple map of bucket names by region | `{"us-east-1" = "prefix-us-east-1"}` |
| `bucket_arns_by_region` | Map of bucket ARNs by region | `{"us-east-1" = "arn:aws:s3:::prefix-us-east-1"}` |
| `account_id` | AWS Account ID where buckets are created | `"123456789012"` |
| `regions_deployed` | List of regions where buckets are deployed | `["us-east-1", "us-west-2"]` |

### Output Structure Example

```hcl
inventory_collector_buckets = {
  "us-east-1" = {
    bucket_id   = "my-org-s3-inventory-us-east-1"
    bucket_arn  = "arn:aws:s3:::my-org-s3-inventory-us-east-1"
    bucket_name = "my-org-s3-inventory-us-east-1"
    region      = "us-east-1"
  }
  "us-west-2" = {
    bucket_id   = "my-org-s3-inventory-us-west-2"
    bucket_arn  = "arn:aws:s3:::my-org-s3-inventory-us-west-2"
    bucket_name = "my-org-s3-inventory-us-west-2"
    region      = "us-west-2"
  }
}
```

## 🔧 Configuring S3 Inventory on Source Buckets

After deploying this module, configure S3 Inventory on your source buckets:

### 1. Via AWS Console

1. Navigate to your source bucket in the S3 console
2. Go to **Management** → **Inventory configurations**
3. Click **Create inventory configuration**
4. Configure:
   - **Destination bucket**: Use the collector bucket in the same region
   - **Destination prefix**: `account-{AccountId}/bucket-{BucketName}/`
   - **Frequency**: Daily or Weekly
   - **Format**: CSV, ORC, or Parquet
   - **Fields**: Select required metadata fields

### 2. Via AWS CLI

```bash
aws s3api put-bucket-inventory-configuration \
    --bucket SOURCE_BUCKET_NAME \
    --id daily-inventory \
    --inventory-configuration '{
        "Id": "daily-inventory",
        "Destination": {
            "S3BucketDestination": {
                "Bucket": "arn:aws:s3:::my-org-s3-inventory-us-east-1",
                "Prefix": "account-123456789012/my-source-bucket/",
                "Format": "CSV",
                "AccountId": "DESTINATION_ACCOUNT_ID"
            }
        },
        "Schedule": {"Frequency": "Daily"},
        "IncludedObjectVersions": "Current",
        "IsEnabled": true,
        "OptionalFields": ["Size", "LastModifiedDate", "StorageClass", "ETag", "EncryptionStatus"]
    }'
```

### 3. Via Terraform

```hcl
resource "aws_s3_bucket_inventory" "example" {
  bucket = "source-bucket-name"
  name   = "daily-inventory"

  included_object_versions = "Current"
  
  schedule {
    frequency = "Daily"
  }
  
  destination {
    bucket {
      format     = "CSV"
      bucket_arn = module.s3_inventory_collector.bucket_arns_by_region["us-east-1"]
      prefix     = "account-${data.aws_caller_identity.current.account_id}/"
      
      encryption {
        sse_s3 {
          # SSE-S3 encryption
        }
      }
    }
  }
  
  optional_fields = [
    "Size",
    "LastModifiedDate", 
    "StorageClass",
    "ETag",
    "EncryptionStatus"
  ]
}
```

## 🔒 Security Considerations

### Bucket Policies

The module implements two types of bucket policies:

1. **Organization-wide Policy**: Allows any bucket within the specified AWS Organization to send inventory reports
2. **Account-specific Policy**: Restricts access to explicitly listed AWS accounts

Both policies enforce:
- Service principal restriction (only S3 service can write)
- ACL requirements (`bucket-owner-full-control`)
- Source validation conditions

### Encryption

- Default: AES256 (S3-managed keys)
- Optional: AWS KMS encryption for enhanced security
- All data is encrypted at rest

### Access Controls

- Public access is completely blocked
- Versioning protects against accidental deletions
- Lifecycle policies prevent unlimited storage growth

## 🚨 Important Notes

1. **Regional Constraints**: S3 Inventory reports MUST be delivered to a bucket in the same region as the source bucket. Cross-region delivery is not supported by AWS.

2. **IAM Permissions**: Ensure your Terraform execution role has permissions to:
   - Create S3 buckets in all target regions
   - Attach bucket policies
   - Configure encryption and lifecycle rules

3. **Bucket Naming**: The `collector_bucket_prefix` must be globally unique across all AWS accounts. Choose a prefix that includes your organization name or identifier.

4. **Cost Considerations**:
   - Storage costs for inventory files
   - Request costs for inventory delivery
   - Data transfer costs (within region are free)
   - Use lifecycle policies to control costs

5. **Inventory File Format**: 
   - CSV: Human-readable, larger file size
   - Apache ORC: Optimized for analytics, compressed
   - Apache Parquet: Best for big data processing, highly compressed

## 🔍 Monitoring and Maintenance

### CloudWatch Metrics

Monitor these metrics for your collector buckets:
- `BucketSizeBytes`: Total size of inventory data
- `NumberOfObjects`: Count of inventory files
- `AllRequests`: Inventory delivery attempts

### Recommended Alarms

```hcl
resource "aws_cloudwatch_metric_alarm" "inventory_bucket_size" {
  alarm_name          = "s3-inventory-bucket-size-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name        = "BucketSizeBytes"
  namespace          = "AWS/S3"
  period             = "86400"
  statistic          = "Average"
  threshold          = "107374182400"  # 100 GB
  alarm_description  = "Alert when inventory bucket exceeds 100GB"
}
```

## 🐛 Troubleshooting

### Common Issues

1. **Inventory not delivered**:
   - Verify source and destination buckets are in the same region
   - Check bucket policy allows the source account
   - Ensure the S3 service has necessary permissions

2. **Access denied errors**:
   - Verify organization ID is correct
   - For account-specific mode, ensure all accounts are listed
   - Check that bucket policies were applied successfully

3. **High storage costs**:
   - Reduce `inventory_retention_days`
   - Enable lifecycle rules
   - Consider using Parquet format for compression

## 📚 Additional Resources

- [AWS S3 Inventory Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-inventory.html)
- [S3 Inventory Pricing](https://aws.amazon.com/s3/pricing/)
- [S3 Best Practices](https://docs.aws.amazon.com/AmazonS3/latest/userguide/security-best-practices.html)

## 📄 License

This module is provided as-is for use in AWS environments. Ensure compliance with your organization's policies and AWS best practices.

## 🤝 Contributing

Contributions are welcome! Please ensure:
- Code follows Terraform best practices
- Variables are properly documented
- Examples are tested and working
- Security considerations are addressed