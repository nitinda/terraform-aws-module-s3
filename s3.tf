resource "aws_s3_bucket" "s3_bucket" {
  bucket                               = "${var.bucket_name}"
  acl                                  = "private"
  force_destroy                        = true
  lifecycle_rule                       = "${var.lifecycle_rule}"
  server_side_encryption_configuration = "${var.server_side_encryption_configuration}"
  replication_configuration            = "${var.replication_configuration}"
  tags                                 = "${var.common_tags}"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = "${aws_s3_bucket.s3.id}"
  block_public_acls       = "${var.bucket_public_access_block["block_public_acls"]}"
  block_public_policy     = "${var.bucket_public_access_block["block_public_policy"]}"
  ignore_public_acls      = "${var.bucket_public_access_block["ignore_public_acls"]}"
  restrict_public_buckets = "${var.bucket_public_access_block["restrict_public_buckets"]}"
}