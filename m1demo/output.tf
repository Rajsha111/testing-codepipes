output "aws_url" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}
output "gcp_url" {
  value = "http://storage.cloud.google.com/${google_storage_bucket.website_bucket.name}/index.html"
}
