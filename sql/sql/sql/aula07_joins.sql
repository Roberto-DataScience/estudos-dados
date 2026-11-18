-- =============================================
-- Aula 7: JOIN (INNER JOIN e LEFT JOIN)
-- =============================================
-- JOIN (INNER): só as linhas que têm par nas duas tabelas
-- LEFT JOIN: todas as linhas da tabela da esquerda (FROM), com ou sem par
-- Todo JOIN precisa de um ON. Sem ON = produto cartesiano (6 vendas x 5 clientes = 30 linhas!)
-- Pergunta-chave: "cada linha do resultado representa o quê?" -> define a tabela do FROM

-- Exercício 1: vendas com a categoria do produto
SELECT v.cliente,
       v.produto,
       v.quantidade,
       p.categoria
FROM vendas AS v
JOIN produtos AS p
  ON v.produto = p.produto;

-- Exercício 2: lucro de cada venda
-- Lição: os parênteses são obrigatórios (5 * 80 - 40 = 360, mas 5 * (80 - 40) = 200)
SELECT v.cliente,
       v.produto,
       v.quantidade * (v.preco - p.custo) AS lucro
FROM vendas AS v
JOIN produtos AS p
  ON v.produto = p.produto
ORDER BY lucro DESC;

-- Exercício 3: faturamento por categoria
SELECT p.categoria,
       SUM(v.quantidade * v.preco) AS faturamento
FROM vendas AS v
JOIN produtos AS p
  ON v.produto = p.produto
GROUP BY p.categoria
ORDER BY faturamento DESC;

-- Exercício 4: todos os clientes e quantas compras fizeram (inclusive quem nunca comprou)
-- Lição: com LEFT JOIN, COUNT(*) conta a linha "vazia" e diz que a Eduarda comprou 1 vez!
-- COUNT(v.cliente) ignora os NULL e mostra o valor correto: 0
SELECT c.nome,
       COUNT(v.cliente) AS qtd_compras
FROM clientes AS c
LEFT JOIN vendas AS v
  ON c.nome = v.cliente
GROUP BY c.nome
ORDER BY qtd_compras DESC;

-- Exercício 5: faturamento por canal de aquisição
SELECT c.canal,
       SUM(v.quantidade * v.preco) AS faturamento
FROM clientes AS c
JOIN vendas AS v
  ON c.nome = v.cliente
GROUP BY c.canal
ORDER BY faturamento DESC;

-- Variação: quantos clientes cada canal trouxe
SELECT canal,
       COUNT(*) AS qtd_clientes
FROM clientes
GROUP BY canal
ORDER BY qtd_clientes DESC;