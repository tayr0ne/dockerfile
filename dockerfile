FROM ubuntu

MAINTAINER Tayrone Martins <tayronedev@gmail.com>

RUN apt-get update

RUN apt-get install -y nginx && apt-get clean

ADD ./configs/nginx.conf /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log

RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 8080

ENTRYPOINT [“/usr/sbin/nginx”]

CMD [“start”, “-g”]