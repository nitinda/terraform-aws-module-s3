# Terraform Module Name: terraform-aws-module-s3


## General

This module may be used to create S3 resources in AWS cloud provider..

---

## Features

Below we are able to check the resources that are being created as part of this module call:

From branch : *terraform-11*


From branch : *terraform-12*


---

## Usage

The variables that required in order for the module to be successfully called from the layers are the following:

| Variable            |          Description         |    Type    |
|---------------------|------------------------------|------------|
| <varriable_name>    | <description>                | <type>     |
| bucket_name         | Bucket name                  | string     |
| lifecycle_rule      | Lifecycle rule               | string     |
| common_tags         | Tags                         | map        |


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
Module maintained by Module maintained by the [Nitin Das]