# _Terraform Module Name: terraform-module-aws-s3_

<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->

## _General_

_This module may be used to create_ **_S3_** _resources in AWS cloud provider......._

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.18_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---

## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

- **_S3 bucket_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-12/master"

  ## Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }

  ##
  bucket_prefix = "s3-project-bucket-name"

}
```

```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-12/master"

  ## Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }

  ##
  bucket = "s3-project-bucket-name"

}
```

```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-12/master"

  ## Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }

  ##
  force_destroy = true
  bucket        = "s3-project-bucket-name"

}
```

```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-12/master"

  ## Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }

  ##
  force_destroy = true
  bucket        = "s3-project-bucket-name"

  versioning = {
      enabled = false
  }
}
```


```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-12/master"

  ## Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }

  ##
  force_destroy = true
  bucket        = "s3-project-bucket-name"

  versioning = {
      enabled = false
  }

  server_side_encryption_configuration = {
      rule = {
          apply_server_side_encryption_by_default = {
              sse_algorithm = "AES256"
          }
      }
  }


}
```

```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=terraform-12/master"

  ## Tags
  tags = {
      Project      = "POC"
      Environment  = "prod"
  }

  ##
  force_destroy = true
  bucket        = "s3-project-bucket-name"

  versioning = {
      enabled = false
  }

  server_side_encryption_configuration = {
      rule = {
          apply_server_side_encryption_by_default = {
              sse_algorithm = "AES256"
          }
      }
  }

  lifecycle_rule = {
      id      = "log_expiration_lifecycle_rule"
      abort_incomplete_multipart_upload_days = 1
      enabled = true

      transition = [
          {
              days = 30
              storage_class = "STANDARD_IA"
          },
          {
              days = 60
              storage_class = "GLACIER"
          }
      ],
      expiration = {
          days = 90
      }
  }
}
```
---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|:---:|
| **_bucket_** | _The name of the bucket_ | _string_ | **_Optional <br/> - (Default - null)_** |
| **_bucket\_prefix_** | _Creates a unique bucket name <br/> beginning with the specified prefix_ | _string_ | **_Optional <br/> - (Default - null)_** |
| **_acl_** | _The canned ACL to apply_ | _string_ | **_Optional <br/> - (Default - null)_** |
| **_grant_** | _An ACL policy grant_ | _any_ | **_Optional <br/> - (Default - [])_** |
| **_policy_** | _A valid bucket policy JSON document_ | _any_ | **_Optional <br/> - (Default - null)_** |
| **_tags_** | _A mapping of tags to assign to the resource_ | _map(string)_ | **_Required_** |
| **_force\_destroy_** | _A boolean that indicates all objects_ | _bool_ | **_Optional <br/> - (Default - false)_** |
| **_versioning_** | _S3 Object versioning Enable_ | _map(string)_ | **_Optional <br/> - (Default - {})_** |
| **_logging_** | _A settings of bucket logging_ | _any_ | **_Optional <br/> - (Default - {})_** |
| **_lifecycle\_rule_** | _A configuration of <br/> object lifecycle management_ | _any_ | **_Optional <br/> - (Default - {})_** |
| **_replication\_configuration_** | _A configuration of replication configuration_ | _any_ | **_Optional <br/> - (Default - {})_** |
| **_server\_side\_encryption\_configuration_** | _A configuration of server-side encryption_ | _any_ | **_Optional <br/> - (Default - {})_** |


---


## Outputs

- **_arn_**
- **_id_**


---


### _Usage_

_In order for the variables to be accessed at module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```


_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<layer_name>.<output_variable_name>
```

---


## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**