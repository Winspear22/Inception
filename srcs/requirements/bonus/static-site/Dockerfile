FROM debian:buster

RUN echo "\033[1;36m==========================================\033[0m" \
&&  echo "\033[1;37mINSTALLING NOW STATIC SITE WITH DOCKERFILE\033[0m" \
&&  echo "\033[1;36m==========================================\033[0m"
RUN apt-get update -y
RUN apt-get upgrade -y
RUN echo "\033[1;36m=================\033[0m" \
&&  echo "\033[1;37mINSTALLING NODEJS\033[0m" \
&&  echo "\033[1;36m================\033[0m"

RUN apt-get install -y nodejs

RUN echo "\033[1;36m=====================================\033[0m" \
&&  echo "\033[1;37mCOPYING TH SITE AND EXPOSING PORT 150\033[0m" \
&&  echo "\033[1;36m=====================================\033[0m"
COPY conf/site.js .
EXPOSE 150
RUN echo "\033[1;36m===========================\033[0m" \
&&  echo "\033[1;37mLAUCHING THE SITE WITH NODE\033[0m" \
&&  echo "\033[1;36m===========================\033[0m"

CMD ["node", "site.js"]