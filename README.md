# xs-jinks

> Builds Jenkins blueocean image, Jenkins automated

## Makefile
```sh

$ make help
archive            Archive image locally (compressed tar file)
build              Build docker image
deploy             Deploy into field
login              Login to DockerHub, expect user=<username>, pass=<password>
login-ecr          Login to AWS ECR
push               Push to DockerHub registry
push-ecr           Push to AWS ECR
ssh                SSH into image
tag                Tag for DockerHub Registry
tag-ecr            Tag for AWS ECR
test               Test whatever needs testing

```

## [License](LICENSE.md)
