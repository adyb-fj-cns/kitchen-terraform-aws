# AWS Credentials
access_key_id=$(shell aws configure get default.aws_access_key_id)
secret_access_key=$(shell aws configure get default.aws_secret_access_key)
default_region=eu-west-1

# Docker 
docker_image=adybfjcns/bundle-terraform-awspec
command=bundle install; bundle exec kitchen test

test-modules:
	
	docker run -ti --rm \
	-v $(shell pwd):/apps \
	-e AWS_ACCESS_KEY_ID=$(access_key_id) \
	-e AWS_SECRET_ACCESS_KEY=$(secret_access_key) \
	-e AWS_DEFAULT_REGION=$(default_region) \
	$(docker_image) \
	bash -c '$(command)'