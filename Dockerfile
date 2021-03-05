FROM alpine:3.12

RUN apk add --no-cache openvpn curl

ENTRYPOINT ["openvpn"]
