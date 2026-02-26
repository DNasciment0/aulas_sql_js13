CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    turma VARCHAR(50) NOT NULL,
    nota DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_estudantes (nome, idade, turma, nota) VALUES 
('Lucas Almeida', 15, '1º Ano A', 8.5),
('Beatriz Gomes', 16, '2º Ano B', 6.0),
('Rafael Dias', 15, '1º Ano A', 9.2),
('Juliana Lima', 17, '3º Ano C', 5.5),
('Thiago Mendes', 16, '2º Ano B', 7.5),
('Camila Rocha', 15, '1º Ano A', 4.8),
('Pedro Henrique', 17, '3º Ano C', 8.0),
('Letícia Martins', 16, '2º Ano B', 9.8);

SELECT * FROM tb_estudantes WHERE nota > 7.0;

SELECT * FROM tb_estudantes WHERE nota < 7.0;

UPDATE tb_estudantes SET nota = 7.0 WHERE id = 4;

SELECT*FROM tb_estudantes