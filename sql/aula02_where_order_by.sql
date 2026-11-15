-- =============================================
-- Aula 2: WHERE, AND/OR, IN e ORDER BY
-- =============================================

-- Exercício 1: todas as vendas de Recife
-- Lição: filtro de texto diferencia maiúsculas de minúsculas ('recife' retorna 0 linhas)
SELECT *
FROM vendas
WHERE cidade = 'Recife';

-- Exercício 2: cliente, produto e preco das vendas com preço menor que 500
-- Lição: listar só as colunas pedidas, em vez de usar SELECT *
SELECT cliente, produto, preco
FROM vendas
WHERE preco < 500;

-- Exercício 3: todas as vendas, da data mais recente para a mais antiga
-- Lição: datas no formato ISO (AAAA-MM-DD) ordenam corretamente mesmo como texto
SELECT *
FROM vendas
ORDER BY data DESC;

-- Exercício 4: cliente, produto e total das vendas de Salvador ou Fortaleza,
-- do maior total para o menor
-- Lição: cada lado do OR precisa ser uma condição completa
-- (cidade = 'Salvador' OR 'Fortaleza' não dá erro, mas traz o resultado errado!)
SELECT cliente, produto, quantidade * preco AS total
FROM vendas
WHERE cidade = 'Salvador' OR cidade = 'Fortaleza'
ORDER BY total DESC;

-- Bônus: o mesmo filtro do exercício 4, usando IN para maior praticidade
-- em listas e tabelas com grandes quantidades
SELECT cliente, produto, quantidade * preco AS total
FROM vendas
WHERE cidade IN ('Salvador', 'Fortaleza')
ORDER BY total DESC;