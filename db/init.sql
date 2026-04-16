CREATE TABLE IF NOT EXISTS movies (
    movie_id    VARCHAR(20) PRIMARY KEY,
    title       VARCHAR(255),
    year        VARCHAR(10),
    genre       VARCHAR(255),
    director    VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS users (
    user_id     INTEGER PRIMARY KEY,
    name        VARCHAR(100),
    email       VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ratings (
    id          SERIAL PRIMARY KEY,
    user_id     INTEGER REFERENCES users(user_id),
    movie_id    VARCHAR(20) REFERENCES movies(movie_id),
    rating      INTEGER CHECK (rating BETWEEN 1 AND 5),
    timestamp   DATE
);
