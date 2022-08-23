FROM nginx:latest
COPY /src /var/www/html
COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]