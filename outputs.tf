output "bucket_name" {
  description = "The name of the private S3 bucket"
  value       = aws_s3_bucket.private_bucket.bucket
}
