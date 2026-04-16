FROM postgres:15

ENV POSTGRES_DB=movieflix
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123

COPY db/init.sql /docker-entrypoint-initdb.d/init.sql
