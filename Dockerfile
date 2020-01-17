# build stage
FROM registry.access.redhat.com/ubi8/nodejs-10 as build-stage
WORKDIR /app
USER root
COPY --chown=1001:1001 package*.json ./
RUN npm install
COPY --chown=1001:1001 . .
RUN npm run build

# production stage
FROM nginx:stable as production-stage
# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
# users are not allowed to listen on priviliged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf
# vue-router history mode
RUN sed -i.bak '/root\ *\/usr/i\ \ \ \ \ \ \ \ try_files $uri $uri/ /index.html;' /etc/nginx/conf.d/default.conf
EXPOSE 8080
# comment user directive as master process is run as user in OpenShift anyhow
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

COPY --from=build-stage /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
