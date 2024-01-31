resource "aws_s3_bucket" "bucket" {
  bucket = "${lower(var.environment)}-${var.bucket_name}"

  tags = merge(var.tags, {
    Name        = "${lower(var.environment)}-${var.bucket_name}"
    Environment = "${var.environment}"
  })
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_key_arn
    }
  }
}

resource "aws_s3_bucket_policy" "disable_non_https" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.disable_non_https.json
}

resource "aws_s3_bucket_logging" "logging" {
  bucket = aws_s3_bucket.bucket.id

  target_bucket = aws_s3_bucket.bucket.id
  target_prefix = "access-log/"
}

resource "aws_s3_bucket_public_access_block" "access_good" {
  bucket              = aws_s3_bucket.bucket.id
  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}