# Summary
<p> 
    This is an lambda application for get data from mongo atlas through vpc peering.
    The lambda function is in a vpc with public subnets, the subnets with lambda use a network interface to allow  access to the internet.
</p>

## Services
* Terraform
* Mongo atlas
* Aws vpc
* Aws vpc peering
* Aws internet gateway
* Aws network interface
* Aws subnets
* Aws route table
* Aws lambda
* Python3.10

## Architecture

<img src="https://raw.githubusercontent.com/Jardielson-s/get_mongo_atlas_data/a0a6a207e661cf9e8119f432e4962633284e65b8/images/lambda-function-mongo-atlas.drawio.svg"/>


## Execute application
1. export envs
```bash
export AWS_ACCESS_KEY_ID="value"
export AWS_SECRET_ACCESS_KEY="value"
```
2. run terraform
```bash
terraform init -backend-config="backend.conf" --var-file="terraform.tfvars"
terraform plan --var-file="terraform.tfvars"
terraform apply --var-file="terraform.tfvars" -auto-approve
```
3. Create Vpc peering, here is a tutorial for that, <a href="https://www.letr.ai/ko/blog/tech-221210"> link  </a>

4. test lambda


## Undo aws resources
1. After completing the tests, you can undo all the resources created in AWS with:
```bash
terraform destroy -auto-approve
```
