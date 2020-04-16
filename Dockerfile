FROM debian:latest

RUN apt-get update && \
   apt-get -y install curl gnupg && \
   curl -sL https://deb.nodesource.com/setup_10.x | bash && \
   apt-get install nodejs -y && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*

COPY index.js package.json /stockapp/
WORKDIR stockapp
RUN npm install
COPY config.json /stockapp/

ENTRYPOINT [ "node", "index"]

