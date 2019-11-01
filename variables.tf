# S3
variable "bucket_name" {
  description = "The name of the bucket."
}

variable "lifecycle_rule" {
  description = "description"
  type        = "list"
}

variable "server_side_encryption_configuration" {
  description = "A configuration of server-side encryption configuration"
  type        = "list"
}

variable "replication_configuration" {
  description = "A configuration of replication configuration"
  type        = "list"
}

# S3 Access
variable "bucket_public_access_block" {
  description = "Manages S3 account-level Public Access Block configuration."
  type        = "map"
}


# Tags
variable "common_tags" {
  description = "Common Tags"
  type        = "map"
}
