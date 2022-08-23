FROM node:17.1.0

WORKDIR /app/oryx

COPY package.json .
COPY develop.sh .
COPY yarn.* .

RUN apt-get update

RUN apt-get install -y python

RUN npm install -g npm@latest

RUN npm install -g @oryxjs/oryx-cli@latest

RUN npm install

COPY . .

ENTRYPOINT ["./develop.sh"]
