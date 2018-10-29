# docker-aws-cli Restart service

This dockerfile will restart your service for respective cluster.

## Build the image
```
docker build \
--build-arg region=<region-name> \
--build-arg cluster=<cluster-name> \
--build-arg service=<service-name> \
--build-arg aws_key=<aws-access-key> \
--build-arg aws_secret=<aws-secret-key> \
. -t aws-cli-restart
```
