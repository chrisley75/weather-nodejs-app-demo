## From latest Alpine Base image
FROM alpine:latest

## Install NPM
RUN apk add --update --no-cache npm

WORKDIR /app
## Copy local content to image
COPY . .

## Install nodejs app
RUN npm install

## Run Test
RUN npm ci

## Copy init script
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh
RUN chmod u+x init.sh

## Exposes the listening port of the application
EXPOSE 80

# Run App
#CMD [ "npm", "start" ]
ENTRYPOINT [ "init.sh" ]

