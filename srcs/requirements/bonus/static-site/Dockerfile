FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
apt-get install -y nodejs

COPY conf/site.js .
EXPOSE 150

CMD ["node", "site.js"]