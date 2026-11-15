-- =============================================
-- Aula 4: DISTINCT e funções de agregação
-- =============================================

-- Exercício 1: cidades da tabela, sem repetição
SELECT DISTINCT cidade
FROM vendas;

-- Exercício 2: faturamento total da loja
SELECT SUM(quantidade * preco) AS faturamento_total
FROM vendas;

-- Exercício 3: preço médio, mínimo e máximo
-- Lição: ROUND(valor, 2) arredonda para 2 casas decimais
SELECT ROUND(AVG(preco), 2) AS preco_medio,
       MIN(preco) AS preco_minimo,
       MAX(preco) AS preco_maximo
FROM vendas;

-- Exercício 4: quantidade de vendas e de unidades de Mouse
-- Lição: "quantas vendas" (COUNT) é diferente de "quantas unidades" (SUM)
-- Lição: sem linhas no filtro, COUNT retorna 0 e SUM retorna NULL (NULL não é zero!)
SELECT COUNT(*) AS qtd_vendas_mouse,
       SUM(quantidade) AS unidades_mouse
FROM vendas
WHERE produto = 'Mouse';

-- Exercício 5: quantos clientes diferentes compraram em Salvador
-- Lição: COUNT(*) daria 3 (Ana comprou 2 vezes); COUNT(DISTINCT) dá 2
SELECT COUNT(DISTINCT cliente) AS clientes_salvador
FROM vendas
WHERE cidade = 'Salvador';