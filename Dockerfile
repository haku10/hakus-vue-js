FROM node:latest

RUN apt update
#vuecliインストール
RUN npm install -g @vue/cli

WORKDIR /my-app
ADD . /my-app

# `package.json` と `package-lock.json` （あれば）を両方コピーする
COPY package*.json ./

# プロジェクトの依存ライブラリをインストールする
RUN npm install
RUN npm run-script build

EXPOSE 8080
CMD [ "npm", "run", "dev"]
