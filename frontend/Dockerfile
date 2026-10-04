

#=================================#
#    Dockerfile for frontend      #
#=================================#


FROM nginxinc/nginx-unprivileged:alpine-slim

USER root
RUN rm -rf /usr/share/nginx/html/*

COPY index.html /usr/share/nginx/html/
COPY css /usr/share/nginx/html/css
COPY js /usr/share/nginx/html/js
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN chown -R 10001:10001 /usr/share/nginx/html

USER 10001

EXPOSE 8080

HEALTHCHECK --intervals=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
