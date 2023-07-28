FROM debian:bookworm-slim
WORKDIR /usr/src/playit

RUN apt-get update
RUN apt-get install -y gnupg curl

RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | apt-key add -
RUN curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list
RUN apt-get update
RUN apt-get install -y playit

RUN apt-get purge

CMD ["playit"]