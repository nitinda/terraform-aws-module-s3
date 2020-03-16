# resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
#   bucket                  = aws_s3_bucket.storage_s3.id
#   block_public_acls       = lookup(var.bucket_public_access_block, "block_public_acls", false)
#   block_public_policy     = lookup(var.bucket_public_access_block, "block_public_policy", false)
#   ignore_public_acls      = lookup(var.bucket_public_access_block, "ignore_public_acls", false)
#   restrict_public_buckets = lookup(var.bucket_public_access_block, "restrict_public_buckets", false)

#   depends_on = [aws_s3_bucket.storage_s3]
# }

