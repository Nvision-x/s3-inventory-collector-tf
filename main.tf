data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "inventory_collector" {
  bucket = var.collector_bucket_name

  tags = merge(
    var.tags,
    {
      Name    = "S3 Inventory Collector Bucket"
      Purpose = "Central collection of S3 inventory from all accounts"
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

resource "aws_s3_bucket_policy" "inventory_collector" {
  bucket = aws_s3_bucket.inventory_collector.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowInventoryFromSourceAccounts"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.inventory_collector.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
            "aws:SourceAccount" = var.source_account_ids
          }
        }
      },
      {
        Sid    = "AllowInventoryBucketCheck"
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
            "aws:SourceAccount" = var.source_account_ids
          }
        }
      }
    ]
  })
}