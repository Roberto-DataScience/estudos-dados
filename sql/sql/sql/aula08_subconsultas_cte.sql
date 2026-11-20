-- =============================================
-- Aula 8: Subconsultas e CTEs (WITH)
-- =============================================
-- Subconsulta: uma consulta dentro de outra, entre parênteses. O banco resolve a de dentro primeiro.
-- CTE (WITH): dá nome a uma etapa e permite usá-la como se fosse uma tabela.
-- Dica: para depurar, rode primeiro só a parte de dentro e confira o resultado.

-- Exemplo: vendas com preço acima da média
SELECT *
FROM vendas
WHERE preco > (SELECT AVG(preco) FROM vendas);

-- Exercício 1: vendas com valor total acima da média dos valores totais
-- Média dos totais: 9140 / 6 = 1523.33 -> só os 2 Notebooks (3500)
SELECT cliente,
       produto,
       quantidade * preco AS total
FROM vendas
WHERE quantidade * preco > (SELECT AVG(quantidade * preco) FROM vendas);

-- Exercício 2: dados dos clientes que compraram em Salvador
-- A subconsulta gera a lista ('Ana', 'Carla')
SELECT nome,
       idade,
       canal
FROM clientes
WHERE nome IN (SELECT cliente FROM vendas WHERE cidade = 'Salvador');

-- Exercício 3: clientes cadastrados que nunca compraram (Eduarda)
-- Alternativa ao LEFT JOIN da aula 7
SELECT nome
FROM clientes
WHERE nome NOT IN (SELECT cliente FROM vendas);

-- Exercício 4: cidades com faturamento acima da média das cidades
-- Faturamentos: 5000, 3740, 400 -> média 3046.67 -> Salvador e Recife
WITH faturamento_cidade AS (
    SELECT cidade,
           SUM(quantidade * preco) AS faturamento
    FROM vendas
    GROUP BY cidade
)
SELECT *
FROM faturamento_cidade
WHERE faturamento > (SELECT AVG(faturamento) FROM faturamento_cidade)
ORDER BY faturamento DESC;

-- Exercício 5 (desafio): lucro por produto e percentual do lucro total
-- Lucro total: 2140 -> Notebook 65.42%, Mouse 14.95%, Monitor 14.02%, Teclado 5.61%
WITH lucro_produto AS (
    SELECT v.produto,
           SUM(v.quantidade * (v.preco - p.custo)) AS lucro
    FROM vendas AS v
    JOIN produtos AS p
      ON v.produto = p.produto
    GROUP BY v.produto
)
SELECT produto,
       lucro,
       ROUND(lucro * 100.0 / (SELECT SUM(lucro) FROM lucro_produto), 2) AS percentual_lucro
FROM lucro_produto
ORDER BY lucro DESC;
-- =============================================
-- Revisão A: produtos cadastrados que nunca foram vendidos (Webcam)
SELECT produto
FROM produtos
WHERE produto NOT IN (SELECT produto FROM vendas);

-- Variação: produtos que foram vendidos pelo menos uma vez (só troca NOT IN por IN)
SELECT produto
FROM produtos
WHERE produto IN (SELECT produto FROM vendas);

-- Revisão B: produtos com unidades vendidas acima da média (Mouse)
WITH unidades_produto AS (
    SELECT produto,
           SUM(quantidade) AS unidades
    FROM vendas
    GROUP BY produto
)
SELECT *
FROM unidades_produto
WHERE unidades > (SELECT AVG(unidades) FROM unidades_produto)
ORDER BY unidades DESC;