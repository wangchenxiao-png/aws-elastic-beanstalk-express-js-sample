FROM registry.cn-hangzhou.aliyuncs.com/jsonhc/node:16.13.0-alpine
WORKDIR /app
COPY . .
RUN npm config set registry https://registry.npmmirror.com
RUN npm install
EXPOSE 8080
CMD node /app/app.js
