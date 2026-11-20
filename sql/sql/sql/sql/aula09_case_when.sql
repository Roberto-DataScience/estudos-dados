-- =============================================
-- Aula 9: CASE WHEN (criar categorias)
-- =============================================
-- CASE WHEN é o "SE" do SQL: testa as condições de cima para baixo e para no primeiro verdadeiro.
-- Lição: com >=, comece pelo MAIOR limite (senão 3500 vira "Média" porque também é >= 300).
-- Lição: sempre use ELSE; sem ele, quem não se encaixa vira NULL.
-- Lição: o ELSE não deve "esconder" dados faltando (idade NULL não pode virar "Adulto").

-- Exercício 1: faixa etária dos clientes
-- Lição: escrever o limite igual à regra de negócio (>= 40, e não > 39)
SELECT nome,
       idade,
       CASE
           WHEN idade >= 40 THEN 'Sênior'
           WHEN idade >= 30 THEN 'Adulto'
           WHEN idade < 30  THEN 'Jovem'
           ELSE 'Sem informação'
       END AS faixa_etaria
FROM clientes;

-- Exercício 2: tipo de venda (atacado ou varejo)
SELECT cliente,
       produto,
       quantidade,
       CASE
           WHEN quantidade >= 3 THEN 'Atacado'
           ELSE 'Varejo'
       END AS tipo_venda
FROM vendas;

-- Exercício 3: classificação dos clientes pelo total gasto
-- Resultado: Ana e Bruno VIP, Diego Regular, Carla Ocasional
WITH total_por_cliente AS (
    SELECT cliente,
           SUM(quantidade * preco) AS total_gasto
    FROM vendas
    GROUP BY cliente
)
SELECT cliente,
       total_gasto,
       CASE
           WHEN total_gasto >= 3000 THEN 'VIP'
           WHEN total_gasto >= 350  THEN 'Regular'
           ELSE 'Ocasional'
       END AS classificacao
FROM total_por_cliente
ORDER BY total_gasto DESC;

-- Exercício 4: quantidade de vendas e faturamento por faixa de valor
-- Resultado: Alta 2 vendas / 7000, Média 3 / 1900, Baixa 1 / 240
WITH vendas_classificadas AS (
    SELECT quantidade * preco AS total,
           CASE
               WHEN quantidade * preco >= 3000 THEN 'Alta'
               WHEN quantidade * preco >= 300  THEN 'Média'
               ELSE 'Baixa'
           END AS faixa
    FROM vendas
)
SELECT faixa,
       COUNT(*) AS qtd_vendas,
       SUM(total) AS faturamento
FROM vendas_classificadas
GROUP BY faixa
ORDER BY faturamento DESC;

-- Exercício 5 (desafio): faturamento por cidade em colunas, numa única linha
-- Técnica: CASE dentro do SUM ("pivotar" linhas em colunas)
-- Resultado: Salvador 5000, Recife 3740, Fortaleza 400
SELECT SUM(CASE WHEN cidade = 'Salvador'  THEN quantidade * preco ELSE 0 END) AS fat_salvador,
       SUM(CASE WHEN cidade = 'Recife'    THEN quantidade * preco ELSE 0 END) AS fat_recife,
       SUM(CASE WHEN cidade = 'Fortaleza' THEN quantidade * preco ELSE 0 END) AS fat_fortaleza
FROM vendas;