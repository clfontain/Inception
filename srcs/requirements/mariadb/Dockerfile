FROM debian:buster

EXPOSE 3306

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /tools/script_mdb.sh ./script_mdb.sh
RUN chmod +x ./script_mdb.sh

ENTRYPOINT ["bash", "script_mdb.sh"]
