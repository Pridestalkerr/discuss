FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ./dist/apps/discuss-backend .
RUN npm install --only=production
EXPOSE ${BACKEND_PORT}
CMD ["node", "main.js"]