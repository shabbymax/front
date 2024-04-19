# syntax=docker/dockerfile:1

FROM node:18-alpine as builder
WORKDIR /frontend
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:1.19.0 as builer2
WORKDIR /usr/share/nginx/html 
RUN ls -al \
    && pwd \
    && rm -rf ./* \
    && ls -al
COPY nginx.conf /etc/nginx/conf.d
COPY --from=builder /frontend/build .
RUN ls -al /etc/nginx/conf.d \
    && ls -al
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
