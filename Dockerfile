# syntax=docker/dockerfile:1

FROM alpine as prepare-db

LABEL maintainer="Specify Collections Consortium <github.com/specify>"

WORKDIR /tmp/

# copy database.sql from the host
COPY ./data/database.sql /tmp/

# get do2unix and curl
RUN apk add --no-cache curl dos2unix

# download default database from the server if database.sql is empty
RUN [ ! -s "database.sql" ] && { curl -o database.sql https://update.specifysoftware.org/docker/database.sql; }

# run dos2unix on the database fie.
RUN dos2unix -f database.sql

# append database creation code to the .sql file
RUN echo "USE specify;" >> database_prepared.sql
RUN cat database.sql >> database_prepared.sql



FROM mariadb:latest as mariadb

COPY --from=prepare-db /tmp/database_prepared.sql /docker-entrypoint-initdb.d/database.sql

# run MariaDB in foreground
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci", "-uroot"]




FROM openjdk:11-jre-buster as install

ARG version

WORKDIR /tmp
RUN wget https://update.specifysoftware.org/${version}/Specify_unix_64.sh

RUN mkdir -p /opt
RUN sh Specify_unix_64.sh -q -dir /opt/Specify




FROM dorowu/ubuntu-desktop-lxde-vnc as run

RUN apt-get update && apt-get -y install --no-install-recommends \
  mysql-client

COPY --from=install /opt/Specify /opt/Specify
COPY --from=install /usr/local/openjdk-11 /usr/local/java
ENV JAVA_HOME /usr/local/java
