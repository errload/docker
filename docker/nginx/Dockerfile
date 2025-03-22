FROM nginx:latest

RUN mkdir -p /var/src
WORKDIR /var/src

RUN apt-get update && apt-get install -y \
curl tar git nano openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/sert.key -out /etc/ssl/certs/sert.crt \
    -subj "/C=RU/ST=Moscow/L=dev/O=local Code/OU=Org/CN=dev.local"

RUN mkdir -p /var/go && cd /var/go
RUN curl -O https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.11.2.linux-amd64.tar.gz && rm go1.11.2.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH $HOME/work
ENV PATH $PATH:$GOPATH/bin
RUN go get github.com/jsha/minica