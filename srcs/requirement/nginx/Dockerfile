FROM debian:bookworm

RUN apt update &&  apt install -y nginx \
    openssl 

RUN  mkdir /etc/nginx/certificate
RUN mkdir /var/www/wordpress

# requiest key and cert generate by -x509 -sha256 and skip pass of -nodes and load rsa with size 2048 and extra key and certi
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048  -keyout /etc/nginx/certificate/certs.key -out /etc/nginx/certificate/certs.csr -subj "/C=US/ST=New York/L=New York City/O=Example Company/CN=asek.42.fr.com"

RUN unlink /etc/nginx/sites-enabled/default

COPY test.conf /etc/nginx/conf.d/test.conf

 
# RUN mkdir -p /var/www/static

# COPY index.html /var/www/static

CMD [ "nginx", "-g", "daemon off;" ]
