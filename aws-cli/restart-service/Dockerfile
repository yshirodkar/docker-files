FROM alpine:3.6
ARG region="test"
ARG cluster="test"
ARG service="test"
ARG aws_key="test"
ARG aws_secret="test"
ENV REGION=$region
ENV CLUSTER=$cluster
ENV SERVICE=$service
ENV AWS_ACCESS_KEY_ID=$aws_key
ENV AWS_SECRET_ACCESS_KEY=$aws_secret
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /root

CMD ["aws --region ${REGION} ecs update-service --cluster ${CLUSTER} --service ${SERVICE} --force-new-deployment"]