# build stage
FROM registry.access.redhat.com/ubi8/nodejs-10 as build-stage
WORKDIR /app
USER root
COPY --chown=1001:1001 package*.json ./
RUN npm install
COPY --chown=1001:1001 . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
