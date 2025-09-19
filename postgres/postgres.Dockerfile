FROM postgres:9.3
LABEL maintainer="Ank"

COPY ./init_postgresql.sh /docker-entrypoint-initdb.d/
COPY ./postgresql.conf /opt/postgresql.conf
COPY docker-healthcheck /usr/local/bin/

RUN chmod 777 /opt

HEALTHCHECK CMD ["docker-healthcheck"]
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432

CMD ["postgres", "-c", "config_file=/opt/postgresql.conf", "-p", "5432"]
