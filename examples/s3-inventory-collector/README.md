# S3 Inventory Collector Module Example

This example demonstrates how to use the S3 Inventory Collector module to create a centralized S3 bucket for collecting inventory data from multiple AWS accounts.

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your specific configuration:
   - Set a unique bucket name
   - Add your source AWS account IDs
   - Adjust retention period as needed

3. Initialize and apply:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Module Features

The module creates:
- S3 bucket for collecting inventory data
- Bucket versioning (optional)
- Server-side encryption
- Public access block
- Lifecycle rules for automatic cleanup
- Bucket policy allowing inventory uploads from specified accounts

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| collector_bucket_name | Name of the S3 collector bucket | string | - |
| source_account_ids | List of AWS account IDs that will send inventory data | list(string) | - |
| inventory_retention_days | Days to retain inventory files | number | 90 |
| enable_versioning | Enable versioning for the bucket | bool | true |
| enable_lifecycle | Enable lifecycle rules | bool | true |
| encryption_algorithm | Encryption algorithm (AES256 or aws:kms) | string | AES256 |
| tags | Tags to apply to resources | map(string) | {} |

## Outputs

| Name | Description |
|------|-------------|
| collector_bucket_name | The name of the collector bucket |
| collector_bucket_arn | The ARN of the collector bucket |
| collector_account_id | AWS account ID where the bucket resides |