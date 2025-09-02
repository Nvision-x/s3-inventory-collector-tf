terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

resource "aws_s3_bucket" "inventory_collector" {

  bucket = "${var.collector_bucket_prefix}-${var.region}"

  tags = merge(
    var.tags,
    {
      Name    = "S3 Inventory Collector Bucket - ${var.region}"
      Purpose = "Regional collection of S3 inventory"
      Region  = var.region
    }
  )
}

resource "aws_s3_bucket_versioning" "inventory_collector" {

  bucket = aws_s3_bucket.inventory_collector.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "inventory_collector" {

  bucket = aws_s3_bucket.inventory_collector.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.encryption_algorithm
    }
  }
}

resource "aws_s3_bucket_public_access_block" "inventory_collector" {

  bucket = aws_s3_bucket.inventory_collector.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "inventory_collector" {
  count = var.enable_lifecycle ? 1 : 0

  bucket = aws_s3_bucket.inventory_collector.id

  rule {
    id     = "delete-old-inventory-files"
    status = "Enabled"

    filter {}

    expiration {
      days = var.inventory_retention_days
    }

    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days
    }
  }
}

data "aws_caller_identity" "current" {}

# Organization-wide access policy
resource "aws_s3_bucket_policy" "inventory_collector_org" {
  count = var.policy_access_mode == "organization" ? 1 : 0

  bucket = aws_s3_bucket.inventory_collector.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowInventoryFromOrganization"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.inventory_collector.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl"    = "bucket-owner-full-control"
            "aws:SourceOrgID" = var.organization_id
          }
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::*"
          }
        }
      },
      {
        Sid    = "AllowInventoryBucketCheckOrg"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action = [
          "s3:GetBucketAcl",
          "s3:ListBucket"
        ]
        Resource = aws_s3_bucket.inventory_collector.arn
        Condition = {
          StringEquals = {
            "aws:SourceOrgID" = var.organization_id
          }
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::*"
          }
        }
      }
    ]
  })
}

# Specific accounts access policy
resource "aws_s3_bucket_policy" "inventory_collector_accounts" {
  count = var.policy_access_mode == "accounts" ? 1 : 0

  bucket = aws_s3_bucket.inventory_collector.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowInventoryFromAccounts"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.inventory_collector.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl"      = "bucket-owner-full-control"
            "aws:SourceAccount" = var.allowed_account_ids
          }
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::*"
          }
        }
      },
      {
        Sid    = "AllowInventoryBucketCheckAccounts"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action = [
          "s3:GetBucketAcl",
          "s3:ListBucket"
        ]
        Resource = aws_s3_bucket.inventory_collector.arn
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = var.allowed_account_ids
          }
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::*"
          }
        }
      }
    ]
  })
}