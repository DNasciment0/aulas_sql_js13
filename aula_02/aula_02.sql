-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;

-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- Visualiza todos os dados menos aquele que voce definir
SELECT*FROM  tb_produtos WHERE NOT categoria_id = 1;

-- // ordenando no final pela categoria selecionada
SELECT*FROM  tb_produtos WHERE NOT categoria_id = 1 ORDER BY nome;

-- // de forma decrescente
SELECT*FROM  tb_produtos WHERE NOT categoria_id = 1 ORDER BY nome, preco DESC;

-- Visualiza os itens que atendem o preco nos valores especificados
SELECT*FROM  tb_produtos WHERE preco IN(5.00, 10.00, 15.00);

-- // em um intervalo específico
SELECT*FROM  tb_produtos WHERE preco BETWEEN 5.00 AND 15.00;

-- // faz a busca de um item, buscando uma string ra em algum lugar da palavra
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";

-- // faz a busca de um item, buscando por uma string ra no comeco da palavra
SELECT * FROM tb_produtos WHERE nome LIKE "ra%";

-- // faz a busca de um item, buscando por uma string ra no final da palavra
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";

-- // Conta quantos elementos tem a tabela, mesmo nao estando preenchido.
SELECT COUNT(*) FROM tb_produtos;

-- // Conta quantos elementos tem a tabela, apenas linhas preenchidas.
SELECT COUNT(categoria_id) FROM tb_produtos;

-- // Soma os precos de todos os itens da tabela
SELECT SUM(preco) FROM tb_produtos;
SELECT SUM(preco) AS soma_precos FROM tb_produtos;

-- //  Faz a média dos precos de todos os itens da tabela
SELECT AVG(preco) AS media_precos FROM tb_produtos;

-- // Faz a média dos precos mas agrupa por categoria
SELECT categoria_id, AVG(preco) AS media_precos FROM tb_produtos GROUP BY categoria_id;

-- //  Exibe o Maior/Menor  Valor de media
SELECT MAX(preco) AS maior_precos FROM tb_produtos;

SELECT MIN(preco) AS menor_precos FROM tb_produtos;

-- //  Pega os dados da tabela produtos que tem uma 
-- intersecao(que contenham a chave estrangeira vinda da tb categoria) com a tabela categoria e exibe a descricao da categoria
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Pega os dados da tabela produtos que tem uma intersecao, mas tudo da tabela a esquerda.
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Pega os dados da tabela produtos que tem uma intersecao, mas tudo da tabela a direita.
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;



SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE descricao =  "frutas"; -- filtra por uma categoria específica 

-- Traz a maior média de precos da tabela produto que tem intersecao com a tabela categoria e agrupa pela descricao.
SELECT descricao, AVG (preco) AS preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY descricao 
HAVING preco_medio > 5.00;


