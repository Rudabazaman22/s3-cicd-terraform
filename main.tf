resource "aws_s3_bucket" "private_bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_acl" "private_acl" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.private_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
