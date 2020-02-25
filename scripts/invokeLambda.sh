#!/usr/bin/env bash -x

cd ..
rm -rf .terraform
rm -rf terraform.tfstate
terraform init
terraform plan
export AWS_SECRET_ACCESS_KEY=secret_key
export AWS_ACCESS_KEY_ID=access_key
export AWS_DEFAULT_REGION=us-west-2
terraform apply -var "localhost=http://docker.for.mac.localhost" --auto-approve
aws lambda get-function --function-name=test_lambda --endpoint-url=http://localhost:4574 --region=us-west-2
aws --endpoint-url=http://localhost:4574 lambda invoke --function=test_lambda --payload fileb://example.json outputfile.txt
