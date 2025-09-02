# Multi-Region S3 Inventory Collector Example

This example demonstrates how to deploy S3 inventory collector buckets across multiple AWS regions with two different access policy modes.

## Prerequisites

- AWS credentials configured
- Terraform >= 1.0
- An AWS Organization ID (for organization mode)
- AWS Account IDs (for accounts mode)

## Usage

### Option 1: Organization-Wide Access (Default)

This mode allows all accounts within your AWS Organization to send inventory data to the collector buckets.

```bash
terraform init
terraform plan
terraform apply
```

The default configuration in `main.tf` uses organization-wide access mode.

### Option 2: Specific Accounts Access

This mode restricts access to only specific AWS account IDs.

To use this mode, you have two options:

#### Using the provided tfvars file:
```bash
terraform init
terraform plan -var-file="terraform.tfvars.accounts"
terraform apply -var-file="terraform.tfvars.accounts"
```

#### Or modify main.tf directly:
Uncomment the accounts mode configuration in `main.tf`:

```hcl
# Option 2: Restrict to specific accounts
policy_access_mode = "accounts"
allowed_account_ids = [
  "123456789012",
  "234567890123"
]
```

## Example Files

- `terraform.tfvars.organization` - Example configuration for organization-wide access
- `terraform.tfvars.accounts` - Example configuration for specific accounts access

## Configuration Options

| Variable | Description | Default |
|----------|-------------|---------|
| `policy_access_mode` | Access mode: "organization" or "accounts" | "organization" |
| `allowed_account_ids` | List of AWS account IDs (used when mode is "accounts") | [] |
| `regions` | List of AWS regions for bucket creation | ["us-east-1", "us-east-2"] |
| `collector_bucket_prefix` | Prefix for bucket names | Required |
| `organization_id` | AWS Organization ID | Required |

## Outputs

After applying, the module will output:
- Bucket names for each region
- Bucket ARNs for each region
- Bucket regional domain names

## Clean Up

To destroy the created resources:
```bash
terraform destroy
```

## Security Notes

- Buckets are created with versioning enabled by default
- Server-side encryption is enabled (AES256 by default)
- Public access is blocked on all buckets
- Lifecycle rules automatically delete old inventory files after 90 days (configurable)