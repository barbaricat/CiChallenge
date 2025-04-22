FROM  node:18-alpine AS builder
# Использую мультистейдж, алпайн и кэшинг для макс уменьшения образа
WORKDIR /app

# Только файлы зависимостей
COPY ./core-service/package.json ./core-service/package-lock.json ./
RUN npm install

# Остальные файлы (исходный код)
COPY core-service/ .
RUN npm run build

# Main image
FROM node:18-alpine
WORKDIR /app

# Выкатывание только прод образа
COPY --from=builder /app/package.json /app/package-lock.json ./
COPY --from=builder /app/dist ./dist
RUN npm install --omit=dev

EXPOSE 3000
CMD ["node", "dist/main.js"]
