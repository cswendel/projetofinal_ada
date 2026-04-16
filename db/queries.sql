-- 1. Top 5 filmes mais avaliados (mais populares)
SELECT m.title, COUNT(r.movie_id) AS total_avaliacoes
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.title
ORDER BY total_avaliacoes DESC
LIMIT 5;

-- 2. Gênero com melhor avaliação média
SELECT
    TRIM(genre_name) AS genero,
    ROUND(AVG(r.rating), 2) AS media_avaliacao
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
CROSS JOIN LATERAL unnest(string_to_array(m.genre, ',')) AS genre_name
GROUP BY genero
ORDER BY media_avaliacao DESC
LIMIT 5;

-- 3. Usuário que mais assiste filmes
SELECT u.name, COUNT(r.user_id) AS filmes_assistidos
FROM ratings r
JOIN users u ON r.user_id = u.user_id
GROUP BY u.name
ORDER BY filmes_assistidos DESC
LIMIT 5;
