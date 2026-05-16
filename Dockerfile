FROM nginx:alpine

# Remove config padrão do nginx
RUN rm /etc/nginx/conf.d/default.conf

# Config nginx para SPA/static com gzip e cache
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia os arquivos do site
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY images/ /usr/share/nginx/html/images/

# Favicons e webmanifest (servidos a partir da raiz)
COPY favicon.ico /usr/share/nginx/html/
COPY favicon-16x16.png /usr/share/nginx/html/
COPY favicon-32x32.png /usr/share/nginx/html/
COPY favicon-48x48.png /usr/share/nginx/html/
COPY apple-touch-icon.png /usr/share/nginx/html/
COPY android-chrome-192x192.png /usr/share/nginx/html/
COPY android-chrome-512x512.png /usr/share/nginx/html/
COPY site.webmanifest /usr/share/nginx/html/

# Injeta timestamp de build no ?v= do CSS — quebra cache do browser a cada deploy
# sem precisar versionar manualmente
ARG BUILD_TIME
RUN BUILD_VER="${BUILD_TIME:-$(date +%s)}" && \
    sed -i "s/BUILD_VERSION/${BUILD_VER}/g" /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
