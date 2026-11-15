-- Cria a tabela de vendas usada nos exercícios das aulas 1 e 2
-- Rodar este script antes dos exercícios (ex.: em sqliteonline.com)

DROP TABLE IF EXISTS vendas;

CREATE TABLE vendas (
  id INTEGER,
  data TEXT,
  cliente TEXT,
  cidade TEXT,
  produto TEXT,
  quantidade INTEGER,
  preco REAL
);

INSERT INTO vendas VALUES
(1,'2026-01-05','Ana','Salvador','Notebook',1,3500),
(2,'2026-01-07','Bruno','Recife','Mouse',3,80),
(3,'2026-01-10','Carla','Salvador','Teclado',2,150),
(4,'2026-02-02','Ana','Salvador','Monitor',1,1200),
(5,'2026-02-15','Diego','Fortaleza','Mouse',5,80),
(6,'2026-03-01','Bruno','Recife','Notebook',1,3500);