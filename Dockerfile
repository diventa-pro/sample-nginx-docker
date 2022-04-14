FROM ubuntu:20.04

USER root

# Installa nginx

RUN apt-get update
RUN apt-get -y install nginx

# Trasferisci i file del sito

COPY index.html /var/www/html/
COPY js/ /var/www/html/js/

RUN chmod 777 -R /var/www/html/

EXPOSE 80
EXPOSE 443

ENV VAR1=value

# Esegui il processo di nginx in primo piano
ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]
CMD [ "-c", "/etc/nginx/nginx.conf" ]