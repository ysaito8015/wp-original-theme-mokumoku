# syntax=docker/dockerfile:1

FROM wordpress:latest
WORKDIR /var/www/html

RUN apt update && \
    apt dist-upgrade -y && \
    apt install -y rsync sudo

RUN useradd -g www-data containeruser && \
    usermod -aG sudo containeruser && \
    echo "containeruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV FIXUID_URL="https://github.com/boxboat/fixuid/releases/download/v0.5.1/fixuid-0.5.1-linux-amd64.tar.gz"
RUN USER=containeruser && \
    GROUP=containeruser && \
    curl -SsL ${FIXUID_URL} | tar -C /usr/local/bin -zxf - && \
    chmod 4755 /usr/local/bin/fixuid && \
   	mkdir -p /etc/fixuid && \
   	printf "user: ${USER}\ngroup: ${GROUP}" > /etc/fixuid/config.yml

USER containeruser:containeruser

CMD ["apache2-foreground"]