from node:alpine AS builder

WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY public public

from httpd:latest
COPY --from=builder /usr/src/app/public /usr/local/apache2/htdocs



