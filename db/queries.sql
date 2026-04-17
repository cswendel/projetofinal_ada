-- 1. Top 5 filmes mais avaliados
SELECT
  m.movie_id,
  m.title,
  COUNT(*) AS total_avaliacoes
FROM ratings r
JOIN movies m ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY total_avaliacoes DESC, m.title
LIMIT 5;

-- 2. Gênero com melhor avaliação média
WITH generos AS (
  SELECT
    TRIM(g) AS genero,
    r.rating
  FROM ratings r
  JOIN movies m ON m.movie_id = r.movie_id
  CROSS JOIN LATERAL unnest(string_to_array(m.genre, ',')) AS g
)
SELECT
  genero,
  ROUND(AVG(rating)::numeric, 2) AS media_avaliacao,
  COUNT(*) AS qtd_avaliacoes
FROM generos
GROUP BY genero
ORDER BY media_avaliacao DESC, qtd_avaliacoes DESC
LIMIT 1;
