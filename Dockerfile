# Build section
FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run phase nginx
FROM nginx as runner

COPY --from=builder /app/build /usr/share/nginx/html