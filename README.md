# Kitchen Terraform (AWS)
This is a basic example of running Test Kitchen (Chef) with terraform provisioned AWS infrastructure.
The docker container is an updated build of `alpine/bundle-terraform-awspec`

The `.kitchen.yml` file contains the kitchen test setup. The main aim of using test kitchen with terraform is to test isolated modules. An example module can be seen in the `modules/demo` folder. The module creates a simple AWS VPC.

Executing test kitchen will 
1. Lint/Verify the module
2. Spin up the module resources
3. Execute rspec tests (awspec) against the resources
4. Teardown

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

## Links
* https://docs.chef.io/kitchen/
* https://github.com/test-kitchen/test-kitchen
* https://hub.docker.com/r/alpine/bundle-terraform-awspec
* https://github.com/alpine-docker/bundle-terraform-awspec
* https://github.com/k1LoW/awspec