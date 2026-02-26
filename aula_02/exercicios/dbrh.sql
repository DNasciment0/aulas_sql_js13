CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_colaboradores (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores (nome, cargo, setor, salario) VALUES 
('Ana Souza', 'Desenvolvedora Júnior', 'TI', 3500.00),
('Carlos Silva', 'Assistente de RH', 'Recursos Humanos', 1800.00),
('Mariana Oliveira', 'Analista de Sistemas', 'TI', 5200.00),
('João Pedro', 'Estagiário Administrativo', 'Administração', 1200.00),
('Fernanda Costa', 'Gerente de Projetos', 'TI', 8500.00);

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 1500.00, cargo = 'Auxiliar Administrativo' WHERE id = 4;

SELECT*FROM tb_estudantes