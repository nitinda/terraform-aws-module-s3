## S3
variable "s3_project_bucket_name" {
  description = "The name of the bucket"
}

variable "versioning" {
  description = "S3 Object versioning Enable"
  type        = map(string)
}

variable "lifecycle_rule" {
  description = "A configuration of object lifecycle management"
  type        = any
}

variable "server_side_encryption_configuration" {
  description = "A configuration of server-side encryption configuration"
  type        = any
}

variable "bucket_public_access_block" {
  description = "Manages S3 bucket-level Public Access Block configuration"
  type        = map(string)
}

variable "force_destroy" {
  description = "A boolean that indicates all objects"
  type        = bool
}

## Tags
variable "common_tags" {
  description = "Resources Tags"
  type        = map(string)
}