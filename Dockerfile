FROM  node:18-alpine AS builder
# Использую мультистейдж, алпайн и кэшинг для макс уменьшения образа
WORKDIR /app


# Только файлы зависимостей, ci быстрее чем install
COPY ./core-service/package.json ./core-service/package-lock.json ./
RUN npm ci --ignore-scripts

# Остальные файлы (исходный код)
COPY core-service/ .
RUN npm run build

# Main image
FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production

# Выкатывание только прод образа
COPY --from=builder /app/package.json /app/package-lock.json ./
COPY --from=builder /app/dist ./dist
RUN npm ci --production --ignore-scripts

EXPOSE 3000
CMD ["node", "dist/main.js"]
