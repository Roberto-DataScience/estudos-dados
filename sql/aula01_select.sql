-- =============================================
-- Aula 1: SELECT, FROM, colunas calculadas e AS
-- =============================================

-- Exercício 1: mostrar só as colunas cliente e produto
SELECT cliente, produto
FROM vendas;

-- Exercício 2: mostrar produto, quantidade e preco
SELECT produto, quantidade, preco
FROM vendas;

-- Exercício 3: mostrar produto e o total de cada venda (quantidade x preço)
-- Lição: incluir uma coluna que identifique a linha (cliente) facilita conferir o resultado
SELECT cliente, produto, quantidade * preco AS total
FROM vendas;