CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos (nome, categoria, quantidade_estoque, preco) VALUES 
('Smartphone XYZ', 'Eletrônicos', 50, 2500.00),
('Teclado Mecânico', 'Periféricos', 120, 350.00),
('Monitor 27 Polegadas', 'Eletrônicos', 30, 1200.00),
('Mouse Gamer', 'Periféricos', 80, 150.00),
('Cadeira de Escritório', 'Móveis', 15, 800.00),
('Headset Bluetooth', 'Áudio', 60, 450.00),
('Notebook Pro', 'Eletrônicos', 20, 5500.00),
('Mousepad Gigante', 'Periféricos', 200, 80.00);

SELECT * FROM tb_produtos WHERE preco > 500.00;

SELECT * FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET preco = 95.00, quantidade_estoque = 180 WHERE id = 8;

SELECT*FROM tb_estudantes