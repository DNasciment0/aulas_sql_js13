-- Criação do Banco de Dados 
CREATE DATABASE IF NOT EXISTS db_generation_game_online;
USE db_generation_game_online;

-- Criação da Tabela de Classes 
CREATE TABLE IF NOT EXISTS tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    tipo_dano VARCHAR(50) NOT NULL
);

--  Criação da Tabela de Personagens 
CREATE TABLE IF NOT EXISTS tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Inserindo registros na tabela 
INSERT INTO tb_classes (nome_classe, tipo_dano) VALUES
('Guerreiro', 'Físico'),
('Mago', 'Mágico'),
('Arqueiro', 'Físico'),
('Assassino', 'Físico'),
('Curandeiro', 'Mágico');

-- Inserindo  registros na tabela de personagens 
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Capitão América', 2500, 3000, 15, 1),  -- Guerreiro
('Doutor Estranho', 3500, 1200, 18, 2),  -- Mago
('Rambo', 2200, 1500, 10, 3),            -- Arqueiro 
('John Wick', 2800, 1100, 12, 4),        -- Assassino
('Mestre Miyagi', 1000, 2500, 20, 5),    -- Curandeiro
('Mulher Maravilha', 3200, 2800, 16, 1), -- Guerreira
('Harry Potter', 2100, 900, 10, 2),      -- Mago
('Coringa', 1900, 800, 9, 4);            -- Assassino

-- personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- personagens que possuam a letra C no nome 
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- Unindo tabelas
SELECT * FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id;

-- filtrando apenas pela classe dos Arqueiros
SELECT * FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id 
WHERE tb_classes.nome_classe = 'Arqueiro';

SELECT * FROM tb_personagens
