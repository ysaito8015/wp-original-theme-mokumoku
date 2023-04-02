# syntax=docker/dockerfile:1

FROM wordpress:latest
#WORKDIR /var/www/html

RUN apt update && apt dist-upgrade -y

USER 0
USER $CONTAINER_USER_ID

CMD ["apache2-foreground"]
