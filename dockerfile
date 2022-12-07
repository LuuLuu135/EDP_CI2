FROM bash:alpine3.16

WORKDIR /app
RUN apk add jq curl
COPY . .
CMD ["bash", "script.sh"]
