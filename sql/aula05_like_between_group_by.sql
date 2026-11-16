-- =============================================
-- Aula 5: LIKE, BETWEEN e GROUP BY
-- =============================================

-- Exercício 1: vendas de produtos que começam com a letra M
-- Lição: % = qualquer quantidade de caracteres; _ = exatamente um caractere
SELECT *
FROM vendas
WHERE produto LIKE 'M%';

-- Exercício 2: vendas de janeiro de 2026
SELECT *
FROM vendas
WHERE data BETWEEN '2026-01-01' AND '2026-01-31';

-- Exercício 3: vendas com preço entre 100 e 1500
-- Lição: número SEM aspas ('80' > '1500' é verdadeiro quando comparado como texto!)
SELECT cliente, produto, preco
FROM vendas
WHERE preco BETWEEN 100 AND 1500;

-- Exercício 4: faturamento por cidade
SELECT cidade,
       SUM(quantidade * preco) AS faturamento
FROM vendas
GROUP BY cidade
ORDER BY faturamento DESC;

-- Exercício 5: quantidade de compras e total gasto por cliente
-- Lição: toda coluna fora de agregação no SELECT precisa estar no GROUP BY
SELECT cliente,
       COUNT(*) AS qtd_compras,
       SUM(quantidade * preco) AS total_gasto
FROM vendas
GROUP BY cliente
ORDER BY total_gasto DESC;

-- Exercício 6: unidades vendidas por produto
-- Lição: "quantas vezes?" = COUNT; "quanto no total?" = SUM
-- Lição: critério de desempate no ORDER BY deixa o resultado sempre igual
SELECT produto,
       SUM(quantidade) AS unidades_vendidas
FROM vendas
GROUP BY produto
ORDER BY unidades_vendidas DESC, produto ASC;