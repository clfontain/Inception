FROM alpine:v3.16

RUN apk upgrade -U
RUN apk add curl
RUN apk add bash
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash && apk add nodejs -yq
RUN apk add clean -y 

ADD . /app/
WORKDIR /app
RUN npm install

EXPOSE 2368
VOLUME /app/logs

CMD npm run start
