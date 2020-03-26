FROM node:13-alpine as build
WORKDIR /usr/src/app
COPY . .
RUN npm install -g @angular/cli
RUN npm run build

FROM nginx as nginx
COPY --from=build /usr/src/app/dist/* /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80