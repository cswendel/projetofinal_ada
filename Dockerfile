FROM postgres:15

ENV POSTGRES_DB=movieflix
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123

COPY db/init.sql        /docker-entrypoint-initdb.d/init.sql
COPY extract/movies.csv /docker-entrypoint-initdb.d/movies.csv
COPY extract/users.csv  /docker-entrypoint-initdb.d/users.csv
COPY extract/ratings.csv /docker-entrypoint-initdb.d/ratings.csv
