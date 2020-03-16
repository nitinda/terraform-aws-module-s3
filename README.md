# _Terraform Module Name: terraform-module-aws-s3_


## _General_

_This module may be used to create_ **_S3_** _resources in AWS cloud provider........_

---


## _Prerequisites_

_This module needs_ **_Terraform 0.11.14_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---

## _Features Branches_

_Below we are able to check the resources that are being created as part of this module call:_

_From branch :_ **_terraform-11/master_**

- **_S3 bucket (Terraform 11 supported code)_**

_From branch :_ **_terraform-12/master_**

- **_S3 bucket (Terraform 12 supported code)_**


---

## _Below are the resources that are launched by this module_

- **_S3_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "s3" {
  source = "git::https://github.com/nitinda/terraform-module-aws-s3.git?ref=master"


}
```
---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|:---:|



_Details are in respective branch._


--- 

## _Outputs_

### _General_

_This module has the following outputs:_

- **_arn_**
- **_id_**


---


### _Usage_

_In order for the variables to be accessed at module level please use the syntax below:_

```tf
"${module.<module_name>.<output_variable_name>}"
```


_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
"${data.terraform_remote_state.<layer_name>.<output_variable_name>}"
```


---


## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**