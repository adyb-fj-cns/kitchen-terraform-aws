#Kitchen Terraform (AWS)
This is a basic example of running kitchen test with terraform provisioned AWS infrastructure.

* https://hub.docker.com/r/alpine/bundle-terraform-awspec
* https://github.com/alpine-docker/bundle-terraform-awspec
* https://github.com/k1LoW/awspec


Using either AWS Credentials in the local credentials file
```
docker run -ti --rm \
-v $(pwd):/apps \
-v ~/.aws:/root/.aws \
adybfjcns/bundle-terraform-awspec \
bash -c 'bundle install; bundle exec kitchen test'
```

Or passing credentials via environment variables if they are set
```
export AWS_ACCESS_KEY_ID="<access key id>"
export AWS_SECRET_ACCESS_KEY="<secret key>"
export AWS_DEFAULT_REGION="<default region>"

docker run -ti --rm \
-v $(pwd):/apps \
-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
-e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
-e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
adybfjcns/bundle-terraform-awspec \
bash -c 'bundle install; bundle exec kitchen test'
```
