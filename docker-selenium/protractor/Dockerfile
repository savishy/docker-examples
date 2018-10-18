FROM node:9.11.1
RUN apt-get update -qqy && apt-get install -y curl jq
COPY test /test
COPY wait-for /wait-for
WORKDIR /test
RUN npm install
RUN npm install -g protractor
WORKDIR /test/
ENTRYPOINT [ "/wait-for", "hub:4444", "-n", "2", "--", "protractor", "conf.js" ]
