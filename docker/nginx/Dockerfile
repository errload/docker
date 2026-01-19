FROM nginx:latest

RUN mkdir -p /var/src
WORKDIR /var/src

RUN apt-get update && apt-get install -y \
curl tar git nano openssl
