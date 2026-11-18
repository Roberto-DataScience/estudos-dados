DROP TABLE IF EXISTS produtos;
CREATE TABLE produtos (
  produto TEXT,
  categoria TEXT,
  custo REAL
);
INSERT INTO produtos VALUES
('Notebook', 'Computadores', 2800),
('Mouse',    'Periféricos',  40),
('Teclado',  'Periféricos',  90),
('Monitor',  'Monitores',    900),
('Webcam',   'Periféricos',  120);

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
  nome TEXT,
  idade INTEGER,
  canal TEXT
);
INSERT INTO clientes VALUES
('Ana',     34, 'Instagram'),
('Bruno',   28, 'Google'),
('Carla',   41, 'Indicação'),
('Diego',   23, 'Instagram'),
('Eduarda', 30, 'Google');