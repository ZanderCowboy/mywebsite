FROM nginx:alpine

COPY build/web /usr/share/nginx/html

RUN mv /usr/share/nginx/html/assets/assets/ /usr/share/nginx/html/assets

RUN ls /usr/share/nginx/html/assets