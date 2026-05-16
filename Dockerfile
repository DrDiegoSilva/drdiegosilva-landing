FROM nginx:alpine

# Remove config padrão do nginx
RUN rm /etc/nginx/conf.d/default.conf

# Config nginx para SPA/static com gzip e cache
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia os arquivos do site
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY images/ /usr/share/nginx/html/images/

# Injeta timestamp de build no ?v= do CSS — quebra cache do browser a cada deploy
# sem precisar versionar manualmente
ARG BUILD_TIME
RUN BUILD_VER="${BUILD_TIME:-$(date +%s)}" && \
    sed -i "s/BUILD_VERSION/${BUILD_VER}/g" /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
