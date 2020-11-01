FROM postgres:12.4
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN mkdir -p /docker-entrypoint-initdb.d
RUN mkdir -p /sql
COPY ./scripts/reconfigure-tzdata.sh /tmp/
RUN chmod a+x /tmp/reconfigure-tzdata.sh
RUN /tmp/reconfigure-tzdata.sh
COPY ./scripts/createUserAndDB.sh /docker-entrypoint-initdb.d/
COPY ./sql/*.sql /sql/
RUN chmod a+x /docker-entrypoint-initdb.d/*.sh

