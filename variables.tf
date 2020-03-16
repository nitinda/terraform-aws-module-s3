## S3
variable "bucket" {
  description = "The name of the bucket"
  default     = null
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix"
  default     = null
}

variable "acl" {
  description = "The canned ACL to apply."
  default     = null
}

variable "grant" {
  description = "An ACL policy grant"
  default     = {}
  type        = any
}

variable "policy" {
  description = "A valid bucket policy JSON document."
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "force_destroy" {
  description = "A boolean that indicates all objects"
  type        = bool
  default     = false
}

variable "versioning" {
  description = "S3 Object versioning Enable"
  type        = map(string)
  default     = {}
}

variable "logging" {
  description = "A settings of bucket logging"
  type        = any
  default     = {}
}

variable "lifecycle_rule" {
  description = "A configuration of object lifecycle management"
  default     = {}
  type        = any
}

variable "replication_configuration" {
  description = "A configuration of replication configuration"
  default     = {}
  type        = any
}

variable "server_side_encryption_configuration" {
  description = "A configuration of server-side encryption configuration"
  type        = any
  default     = {}
}

# variable "object_lock_configuration" {
#   description = "A configuration of S3 object locking"
#   default     = {}
#   type        = any
# }