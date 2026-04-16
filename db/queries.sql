-- Tabela de filmes
CREATE TABLE IF NOT EXISTS movies (
    movie_id    VARCHAR(20) PRIMARY KEY,
    title       VARCHAR(255),
    year        VARCHAR(10),
    genre       VARCHAR(255),
    director    VARCHAR(255)
);

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS users (
    user_id     SERIAL PRIMARY KEY,
    name        VARCHAR(100),
    email       VARCHAR(100)
);

-- Tabela de avaliações
CREATE TABLE IF NOT EXISTS ratings (
    id          SERIAL PRIMARY KEY,
    user_id     INTEGER REFERENCES users(user_id),
    movie_id    VARCHAR(20) REFERENCES movies(movie_id),
    rating      INTEGER CHECK (rating BETWEEN 1 AND 5),
    timestamp   DATE
);

-- Carga dos dados
COPY movies(movie_id, title, year, genre, director)
FROM '/docker-entrypoint-initdb.d/movies.csv'
DELIMITER ','
CSV HEADER;

COPY users(user_id, name, email)
FROM '/docker-entrypoint-initdb.d/users.csv'
DELIMITER ','
CSV HEADER;

COPY ratings(user_id, movie_id, rating, timestamp)
FROM '/docker-entrypoint-initdb.d/ratings.csv'
DELIMITER ','
CSV HEADER;
