--  Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da Tabela de Categorias 
CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo_massa VARCHAR(50) NOT NULL
);

-- Criação da Tabela de Pizzas
CREATE TABLE IF NOT EXISTS tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sabor VARCHAR(100) NOT NULL,
    ingredientes VARCHAR(255),
    tamanho VARCHAR(20) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserindo registros na tabela de categorias
INSERT INTO tb_categorias (nome_categoria, tipo_massa) VALUES
('Tradicional', 'Massa Fina'),
('Especialidades', 'Massa Tradicional'),
('Premium', 'Massa Pan'),
('Vegetariana', 'Massa Fina'),
('Doce', 'Massa Tradicional');

-- Inserindo registros na tabela de pizzas 
INSERT INTO tb_pizzas (sabor, ingredientes, tamanho, valor, categoria_id) VALUES
('Mussarela', 'Queijo, orégano e molho de tomate Domino''s', 'Média', 40.00, 1),
('Pepperoni', 'Pepperoni, queijo e molho de tomate', 'Média', 46.00, 1),
('Margherita', 'Queijo, tomate, manjericão e molho', 'Média', 55.00, 4),
('Meat & Bacon', 'Bacon, pepperoni, presunto, carne e queijo', 'Grande', 75.00, 3),
('Frango com Requeijão', 'Frango desfiado, requeijão e orégano', 'Grande', 65.00, 2),
('Bauru', 'Presunto, queijo, tomate e orégano', 'Média', 42.00, 1),
('Chocolate', 'Creme de baunilha e cobertura de chocolate', 'Broto', 35.00, 5),
('Churros', 'Doce de leite e canela', 'Broto', 38.00, 5);

-- todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- todas as pizzas que possuam a letra 'M' no nome
SELECT * FROM tb_pizzas WHERE sabor LIKE '%M%';

-- unindo os dados da tabela de pizzas com a de categorias
SELECT * FROM tb_pizzas 
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id;

-- filtrando apenas pelas pizzas Doces
SELECT * FROM tb_pizzas 
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id 
WHERE tb_categorias.nome_categoria = 'Doce';

SELECT * FROM tb_pizzas
