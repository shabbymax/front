FROM node:18-alpine
WORKDIR /home/app
COPY package.json .
RUN pwd
RUN npm i
RUN ls -lah
COPY . .
RUN pwd && ls -lah
RUN npm run build
EXPOSE 3000
CMD ["npm","run","start"]
