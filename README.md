# Terraform Module Name: terraform-module-aws-s3


## General

This module may be used to create S3 resources in AWS cloud provider..

---


## Prerequisites

This module needs Terraform 0.11.10 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys S3 bucket.


---

## Below are the resources that are launched by this module

- S3


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-s3-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-11"
  
  providers = {
    aws = "aws" #Changes based on providers
  }

  # Tags
  common_tags = "${var.common_tags}"

  # S3
  bucket_name = "demo-s3-${data.aws_caller_identity.demo_caller_identity_current.account_id}"
  lifecycle_rule = [{
    id      = "log_expiration_lifecycle_rule"
    prefix  = ""
    enabled = true
    noncurrent_version_transition = [{
      days          = "${var.noncurrent_version_transition}"
      storage_class = "STANDARD_IA"
    }]

    noncurrent_version_transition = [{
      days          = 60
      storage_class = "GLACIER"
    }]

    expiration = [{
      expired_object_delete_marker = true
    }]
    
    noncurrent_version_expiration = [{
      days = 90
    }]
    abort_incomplete_multipart_upload_days = 1 
  }]

  server_side_encryption_configuration = [{
    rule = [{
      apply_server_side_encryption_by_default = [{
        sse_algorithm = "AES256"
      }]
    }]
  }]

  bucket_public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
}
```
---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


| Variable                             |          Description                        |    Type      |
|--------------------------------------|---------------------------------------------|--------------|
| bucket_name                          | Bucket name                                 | string       |
| lifecycle_rule                       | Lifecycle rule                              | string       |
| common_tags                          | Tags                                        | map          |
| server_side_encryption_configuration | A configuration of server-side encryption   | list of map  |
| bucket_public_access_block           | Manages S3 account-level Public Access      | list of map  |


Details are in respective branch.


## Outputs

- *s3_arn*
- *s3_id*


Details are in respective branch.


### Usage
In order for the variables to be accessed on module level please use the syntax below:
```bash
module.<module_name>.<output_variable_name>
```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the network layer output terraform file.
- Add the code snippet below to the variables/global_variables file.
```bash
data "terraform_remote_state" "<module_name>" {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "s3-webstack-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/${terraform.workspace}/4_Networking/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```
- The output variable is able to be accessed through terraform state file using the syntax below:
```bash
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
Module maintained by Module maintained by the - Nitin Das
