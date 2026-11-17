-- =============================================
-- Aula 6: HAVING e ticket médio
-- =============================================
-- Ordem de execução: FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
-- WHERE filtra linhas (antes de agrupar); HAVING filtra grupos (depois de agrupar)

-- Exercício 1: clientes que gastaram mais de 1000
SELECT cliente,
       SUM(quantidade * preco) AS total_gasto
FROM vendas
GROUP BY cliente
HAVING SUM(quantidade * preco) > 1000
ORDER BY total_gasto DESC;

-- Exercício 2: produtos vendidos mais de uma vez
-- Lição: ao adaptar um exemplo, revisar cada valor (o exemplo usava > 2)
SELECT produto,
       COUNT(*) AS qtd_vendas
FROM vendas
GROUP BY produto
HAVING COUNT(*) > 1;

-- Exercício 3: ticket médio por cliente
-- Lição: a conta inteira vai DENTRO do ROUND (caixa dentro de caixa)
SELECT cliente,
       ROUND(SUM(quantidade * preco) / COUNT(*), 2) AS ticket_medio
FROM vendas
GROUP BY cliente
ORDER BY ticket_medio DESC;

-- Exercício 4: faturamento por cidade em jan/fev, só acima de 1000
SELECT cidade,
       SUM(quantidade * preco) AS faturamento
FROM vendas
WHERE data BETWEEN '2026-01-01' AND '2026-02-28'
GROUP BY cidade
HAVING SUM(quantidade * preco) > 1000
ORDER BY faturamento DESC;

-- Exercício 5: cidades com mais de 1 cliente diferente
SELECT cidade,
       COUNT(DISTINCT cliente) AS qtd_clientes
FROM vendas
GROUP BY cidade
HAVING COUNT(DISTINCT cliente) > 1;