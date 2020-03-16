resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket
  bucket_prefix = var.bucket_prefix
  acl           = var.acl

  dynamic "grant" {
    for_each = var.grant == {} ? [] : [var.grant]
    content {
      id          = lookup(grant.value, "id", null)
      permissions = grant.value.permissions
      type        = grant.value.type
      uri         = lookup(grant.value, "uri", null)
    }
  }

  policy        = var.policy
  tags          = var.tags
  force_destroy = var.force_destroy

  dynamic "versioning" {
    for_each = var.versioning == {} ? [] : [var.versioning]
    content {
      enabled    = lookup(versioning.value, "enabled", null)
      mfa_delete = lookup(versioning.value, "mfa_delete", null)
    }
  }

  dynamic "logging" {
    for_each = var.logging == {} ? [] : [var.logging]
    content {
      target_bucket = lookup(logging.value, "target_bucket", null)
      target_prefix = lookup(logging.value, "target_prefix", null)
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule == {} ? [] : [var.lifecycle_rule]
    content {
      abort_incomplete_multipart_upload_days = lookup(lifecycle_rule.value, "abort_incomplete_multipart_upload_days", null)
      enabled                                = lifecycle_rule.value.enabled
      id                                     = lookup(lifecycle_rule.value, "id", null)
      prefix                                 = lookup(lifecycle_rule.value, "prefix", null)
      tags                                   = lookup(lifecycle_rule.value, "tags", null)

      # Max 1 block - expiration
      dynamic "expiration" {
        for_each = length(keys(lookup(lifecycle_rule.value, "expiration", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "expiration", {})]
        content {
          date                         = lookup(expiration.value, "date", null)
          days                         = lookup(expiration.value, "days", null)
          expired_object_delete_marker = lookup(expiration.value, "expired_object_delete_marker", null)
        }
      }

      # Max 1 block - noncurrent_version_expiration
      dynamic "noncurrent_version_expiration" {
        for_each = length(keys(lookup(lifecycle_rule.value, "noncurrent_version_expiration", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "noncurrent_version_expiration", {})]
        content {
          days = lookup(noncurrent_version_expiration.value, "days", null)
        }
      }

      # Several blocks - noncurrent_version_transition
      dynamic "noncurrent_version_transition" {
        for_each = length(keys(lookup(lifecycle_rule.value, "noncurrent_version_transition", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "noncurrent_version_transition", {})]
        content {
          days          = lookup(noncurrent_version_transition.value, "days", null)
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

      # Several blocks - transition
      dynamic "transition" {
        for_each = lookup(lifecycle_rule.value, "transition", [])
        content {
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
          storage_class = transition.value.storage_class
        }
      }
    }
  }

  dynamic "replication_configuration" {
    for_each = var.replication_configuration == {} ? [] : [var.replication_configuration]
    content {
      role = replication_configuration.value.role

      dynamic "rules" {
        for_each = lookup(replication_configuration.value, "rules", [])
        content {
          id       = lookup(rules.value, "id", null)
          prefix   = lookup(rules.value, "prefix", null)
          priority = lookup(rules.value, "priority", null)
          status   = rules.value.status

          dynamic "destination" {
            for_each = lookup(rules.value, "destination", [])
            content {
              account_id         = lookup(destination.value, "account_id", null)
              bucket             = destination.value.bucket
              replica_kms_key_id = lookup(destination.value, "replica_kms_key_id", null)
              storage_class      = lookup(destination.value, "storage_class", null)

              dynamic "access_control_translation" {
                for_each = lookup(destination.value, "access_control_translation", [])
                content {
                  owner = access_control_translation.value.owner
                }
              }
            }
          }

          dynamic "filter" {
            for_each = lookup(rules.value, "filter", [])
            content {
              prefix = lookup(filter.value, "prefix", null)
              tags   = lookup(filter.value, "tags", null)
            }
          }

          dynamic "source_selection_criteria" {
            for_each = lookup(rules.value, "source_selection_criteria", [])
            content {
              dynamic "sse_kms_encrypted_objects" {
                for_each = lookup(source_selection_criteria.value, "sse_kms_encrypted_objects", [])
                content {
                  enabled = sse_kms_encrypted_objects.value.enabled
                }
              }
            }
          }
        }
      }
    }
  }
  
  # Max 1 block - server_side_encryption_configuration
  dynamic "server_side_encryption_configuration" {
    for_each = var.server_side_encryption_configuration == {} ? [] : [var.server_side_encryption_configuration]
    content {
      dynamic "rule" {
        for_each = length(keys(lookup(server_side_encryption_configuration.value, "rule", {}))) == 0 ? [] : [lookup(server_side_encryption_configuration.value, "rule", {})]
        content {
          dynamic "apply_server_side_encryption_by_default" {
            for_each = length(keys(lookup(rule.value, "apply_server_side_encryption_by_default", {}))) == 0 ? [] : [lookup(rule.value, "apply_server_side_encryption_by_default", {})]
            content {
              kms_master_key_id = lookup(apply_server_side_encryption_by_default.value, "kms_master_key_id", null)
              sse_algorithm     = apply_server_side_encryption_by_default.value.sse_algorithm
            }
          }
        }
      }
    }
  }

}