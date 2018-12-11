FROM alpine:latest

LABEL version="1.0.0"
LABEL maintainer="GitHub Actions <support+actions@github.com>"

ENV DOCKERVERSION=18.06.1-ce

RUN apk update && apk add git curl bash openssh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
