# S3 Inventory Collector - Multi-Region Terraform Module

This Terraform module creates S3 buckets in multiple regions to collect S3 inventory reports. Since S3 Inventory reports must be delivered to a bucket in the same region as the source bucket, this module automatically creates a collector bucket in each specified region.

## Features

- Creates S3 inventory collector buckets in multiple regions
- Configures bucket policies to allow inventory reports from specified source accounts
- Implements security best practices (encryption, versioning, public access blocking)
- Optional lifecycle rules for automatic cleanup of old inventory files
- Support for cross-account inventory collection

## Usage

```hcl
module "s3_inventory_collector" {
  source = "path/to/module"
  
  regions                 = ["us-east-1", "us-west-2", "eu-west-1"]
  collector_bucket_prefix = "my-org-s3-inventory"
  source_account_ids      = ["123456789012", "234567890123"]
  
  inventory_retention_days = 90
  enable_versioning       = true
  enable_lifecycle        = true
  
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
```

## Regional Deployment

The module creates one bucket per region specified in the `regions` variable. Each bucket:
- Has a name format: `{prefix}-{region}` (e.g., `my-org-s3-inventory-us-east-1`)
- Is configured with identical security and lifecycle policies
- Can receive inventory reports only from source buckets in the same region

## Requirements

- Terraform >= 1.0
- AWS Provider >= 4.0
- Appropriate IAM permissions to create S3 buckets and policies in target regions

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| regions | List of AWS regions where inventory collector buckets will be created | `list(string)` | `["us-east-1", "us-west-2", "eu-west-1"]` | no |
| collector_bucket_prefix | Prefix for the S3 collector bucket names (will be suffixed with region) | `string` | n/a | yes |
| source_account_ids | List of AWS account IDs that will send inventory data | `list(string)` | n/a | yes |
| inventory_retention_days | Number of days to retain inventory files | `number` | `90` | no |
| enable_versioning | Enable versioning for the S3 buckets | `bool` | `true` | no |
| enable_lifecycle | Enable lifecycle rules for the S3 buckets | `bool` | `true` | no |
| encryption_algorithm | Server-side encryption algorithm (AES256 or aws:kms) | `string` | `"AES256"` | no |
| tags | Map of tags to assign to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| inventory_collector_buckets | Map of all inventory collector buckets by region |
| bucket_names_by_region | Map of bucket names by region |
| bucket_arns_by_region | Map of bucket ARNs by region |
| account_id | AWS Account ID where the buckets are created |
| regions_deployed | List of regions where buckets are deployed |

## Setting Up S3 Inventory

After deploying this module, configure S3 Inventory on your source buckets to send reports to the appropriate regional collector bucket:

1. Identify the region of your source bucket
2. Use the collector bucket in the same region as the destination
3. Configure the inventory with the appropriate prefix and format

Example inventory configuration:
```
Destination bucket: my-org-s3-inventory-us-east-1
Prefix: account-123456789012/bucket-name/
Format: CSV or Parquet
Frequency: Daily or Weekly
```

## Important Notes

- S3 Inventory reports MUST be sent to a bucket in the same region as the source bucket
- Cross-region inventory delivery is not supported by AWS
- The module handles this limitation by creating buckets in all required regions
- Ensure your Terraform execution environment has permissions in all target regions