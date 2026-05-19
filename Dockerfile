FROM node:20-alpine3.22 AS builder
WORKDIR /opt/server
COPY package.jsonn .
COPY *.js .
RUN npm install

FROM node:20-alpine3.22
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
ENV MONGO=true \
    REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users"
COPY --from=builder /opt/server /opt/server
RUN chown -R roboshop:roboshop /opt/server
USER roboshop
CMD ["node", "server.js"]