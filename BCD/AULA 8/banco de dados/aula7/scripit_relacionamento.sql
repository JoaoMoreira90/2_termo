CREATE DATABASE IF NOT EXISTS CASTELLO_RELACIONAMENTO;
USE CASTELLO_RELACIONAMENTO;

CREATE TABLE CLIENTES (
    ID_CLIENTES INT AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTES VARCHAR(50) NOT NULL
);

CREATE TABLE PEDIDOS (
    ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    DATA_PEDIDO DATE NOT NULL,
    VALOR_TOTAL DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTES)
);

CREATE TABLE ESTOQUE (
    ID_ESTOQUE INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUTOS INT NOT NULL,
    QUANTIDADE INT NOT NULL,
    FOREIGN KEY (ID_PRODUTOS) REFERENCES PRODUTOS(ID_PRODUTOS)
);

CREATE TABLE PRODUTOS (
    ID_PRODUTOS INT AUTO_INCREMENT PRIMARY KEY,
    NOME_PRODUTOS VARCHAR(100) NOT NULL,
    PRECO DECIMAL(10, 2) NOT NULL
);

SELECT * FROM ESTOQUE;

SELECT * FROM PRODUTOS;

INSERT INTO produtos (NOME_PRODUTOs, PRECO) VALUES
('Produtos A', 10.00),
('Produtos B', 20.00),
('Produtos C', 30.00);


-- desafios

-- Para cada situação, identifique a cardinalidade e justifique.
-- 1. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas
-- uma categoria.

-- categoria-----possui-----produtos
-- 1,N e 1,1


-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um
-- funcionário.

-- Funcionario-----registra-------pedidos
-- 1,1 e 1,n

-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser
-- comprado de vários fornecedores.

-- fornecedor-----comercializa---------produto
-- 1N, e 1,N

-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar
-- vinculada a uma mesa.

-- cliente----reserva----mesa

-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.

-- pedido-----possui----itens
-- 1,N 1,N