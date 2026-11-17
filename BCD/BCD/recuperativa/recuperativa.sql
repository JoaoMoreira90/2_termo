-- Active: 1794918902507@@127.0.0.1@3306@recuperativa_retrogame_joao
DROP DATABASE    recuperativa_retrogame_joao;

CREATE DATABASE IF NOT exists recuperativa_retrogame_joao;

-- fase 1
use recuperativa_retrogame_joao;

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE,

    CONSTRAINT PK_ID_USUARIO PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_EMAIL UNIQUE (EMAIL)
);


CREATE TABLE plataforma(
    id_plataforma int AUTO_INCREMENT,
    nome VARCHAR(80) not null UNIQUE,

    constraint pk_id_plataforma PRIMARY KEY (id_plataforma)
);


CREATE Table categoria(
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(100) not null UNIQUE,

    constraint pk_id_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE jogo(
    id_jogo INT AUTO_INCREMENT,
    titulo VARCHAR(120) not null,
    codigo VARCHAR(80) not null UNIQUE,
    ano_publicado INT,
    quantidade_disponivel INT DEFAULT 0 CHECK (QUANTIDADE_DISPONIVEL >= 0),
    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT PK_jogo PRIMARY KEY (id_jogo),
    CONSTRAINT FK_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    CONSTRAINT FK_categoria FOREIGN KEY (id_categoria) REFERENCES categoria
    (id_categoria)
);

CREATE table locacao(
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE not null,
    data_devolucao DATE,
    status_locacao VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_locacao IN ('ABERTO', 'DEVOLVIDO','fechado')),
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,

    CONSTRAINT PK_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT FK_jogo FOREIGN KEY (id_jogo) REFERENCES jogo
    (id_jogo)
);



ALTER TABLE jogo ADD EDITORA VARCHAR(100);




-- fase 2
INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES 
('JOAO', 'JOAO@EMAIL.COM,', '12345678',TRUE),
('STELLA','STELLA@EMAIL.COM','12345467', TRUE),
('ana', 'ana@email.com', null,TRUE),
('gustavo', 'gustavo@email.com', '1232432', TRUE);





INSERT INTO categoria (descricao) VALUES
('terror'),
('fps');




INSERT INTO plataforma (nome) VALUES
('xbox'),
('pc gamer');

INSERT INTO jogo (titulo, codigo, ano_publicado, quantidade_disponivel, id_categoria, id_plataforma) VALUES
('Valorant', '125653', '2020', 15, '2', '2'),
('Call of Duty: Warzone', '4524566', '2026-06-11', 50, '2', '1'),
('minicraft', '6775357', '2011', 10, '1', '2'),
('roblox', '343532', '2006', 30, '1', '1'),
('Among us', '3435345', '2018', 40, '2', '2'),
('The Legend of Zelda: Tears of the Kingdom', '2635672', '2023', 220, '1', '1');


INSERT INTO locacao
(data_retirada, status_locacao, id_cliente, id_jogo)
VALUES
( 2026, 'ABERTA', 1, 1),
( 2026, 'ABERTA', 2, 2),
( 2026, 'ABERTA', 3, 3);

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo IN (1, 2, 3);











SELECT * from jogo;