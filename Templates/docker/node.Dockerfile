FROM alpine:node

WORKDIR /app
COPY . .

RUN npm install && npm run build

CMD ["npm", "run", "serve"]
