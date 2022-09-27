FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ./dist/apps/discuss-frontend .
RUN npm install --only=production
EXPOSE ${FRONTEND_PORT}
CMD ["npm", "start"]