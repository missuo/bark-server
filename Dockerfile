FROM golang:1.12.0-alpine3.9 AS builder

ENV GO111MODULE on

RUN go get -u github.com/Finb/Bark-Server

FROM alpine:3.9

LABEL maintainer="mritd <mritd1234@gmail.com>"

RUN apk upgrade --no-cache

COPY from=builder /go/bin/Bark-Server /usr/bin/bark

EXPOSE 80

CMD ["bark","-ip","0.0.0.0","-port","80"]
