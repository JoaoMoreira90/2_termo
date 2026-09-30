-- Gera��o de Modelo-- Sql ANSI 2003 - brModelo.



CREATE TABLE clientes (
ID_cliente Texto(1) PRIMARY KEY,
nome_cliente varchar(60) not null
)

CREATE TABLE pedidos (
ID_pedido Texto(1) PRIMARY KEY,
quantidade Texto(1),
ID_cliente Texto(1),
FOREIGN KEY(ID_cliente) REFERENCES clientes (ID_cliente)
)

CREATE TABLE produtos+estoques (
ID_produtos BIGINT AUTO_INCREMENT PRIMARY KEY,,
nome_produtos varchar(100),
ID_estoque BIGINT AUTO_INCREMENT PRIMARY KEY,,
valor desimal (10,2),
PRIMARY KEY(ID_produtos,ID_estoque)
)

CREATE TABLE fornecedor (
ID_fornecedor Texto(1) PRIMARY KEY,
razao_social Texto(1)
)

CREATE TABLE produtos (
ID_produto Texto(1) PRIMARY KEY,
nome_produtos Texto(1)
)

CREATE TABLE item_produto (
ID_produto int,
ID_fornecedor int,
ID_item int auto increment primary key PRIMARY KEY,
quantidade int

