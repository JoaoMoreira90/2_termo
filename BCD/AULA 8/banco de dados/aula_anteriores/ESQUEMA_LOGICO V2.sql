CREATE DATABASE smartcoffee;

USE smartcoffee;

CREATE TABLE Cliente (
    Endereco VARCHAR(100),
    Email VARCHAR(100),
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    CPF VARCHAR(14) NOT NULL,
    Telefone VARCHAR(30) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    id_fidelidade INT,
    id_cçiente INT
);

CREATE TABLE Funcionario (
    Endereco VARCHAR(100) NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    Data_de_Nacimento DATE NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Salario INT,
    Id_funcionario INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Categoria (
    Dengo VARCHAR(30),
    Milka VARCHAR(30),
    Garoto VARCHAR(30),
    Lacta VARCHAR(30) NOT NULL,
    Brasil_Cacau VARCHAR(30) NOT NULL,
    id_categoria INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Produto (
    Id_Produto INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30),
    Nome_do_produto VARCHAR(30) NOT NULL,
    Quantidade VARCHAR(30) NOT NULL,
    Preco INT,
    Validade DATE
);

CREATE TABLE fornecedor (
    mercado VARCHAR(30),
    feira VARCHAR(30),
    farmacia VARCHAR(30),
    conveniencia VARCHAR(30),
    padaria VARCHAR(30),
    id_fonercedor INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Pedido (
    Entregador VARCHAR(15) NOT NULL,
    forma_de_pagamento VARCHAR(1) NOT NULL,
    Cliente VARCHAR(30) NOT NULL,
    Endereco VARCHAR(100),
    Id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    Produto VARCHAR(30) NOT NULL,
    id_cliente INT
);

CREATE TABLE Pagamentos (
    preco VARCHAR(30),
    Horario_da_entrega VARCHAR(30),
    Pix VARCHAR(30),
    Cartao VARCHAR(30),
    Cliente VARCHAR(30),
    Data_de_entrega VARCHAR(30),
    Id_pagamento INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Delivery (
    Entregador VARCHAR(30),
    data_entrega VARCHAR(30),
    status_entrega VARCHAR(30),
    pedido VARCHAR(30) NOT NULL,
    id_delivery INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE programa_de_fidelidade (
    ultima_atualizacao VARCHAR(30),
    data_cadastro VARCHAR(30),
    pontos VARCHAR(30),
    data VARCHAR(30),
    id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    id_cçiente INT
);

CREATE TABLE Estoque (
    Quantidade VARCHAR(30),
    Localizacao VARCHAR(100),
    Ultima_localizacao VARCHAR(100),
    Estoque_minimo VARCHAR(30),
    Id_Estoque INT AUTO_INCREMENT PRIMARY KEY,
    Id_produto INT
);

CREATE TABLE FAZ (
    Id_funcionario INT,
    id_categoria INT,

    PRIMARY KEY (Id_funcionario, id_categoria),

    FOREIGN KEY (Id_funcionario)
        REFERENCES Funcionario(Id_funcionario),

    FOREIGN KEY (id_categoria)
        REFERENCES Categoria(id_categoria)
);

CREATE TABLE REALIZA (
    Id_pagamento INT,
    id_cliente INT,

    PRIMARY KEY (Id_pagamento, id_cliente),

    FOREIGN KEY (Id_pagamento)
        REFERENCES Pagamentos(Id_pagamento),

    FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
);

CREATE TABLE POSSUI (
    id_delivery INT,
    Id_pedidos INT,

    PRIMARY KEY (id_delivery, Id_pedidos),

    FOREIGN KEY (id_delivery)
        REFERENCES Delivery(id_delivery),

    FOREIGN KEY (Id_pedidos)
        REFERENCES Pedido(Id_pedidos)
);

CREATE TABLE TEM (
    Id_funcionario INT,
    Id_pagamento INT,

    PRIMARY KEY (Id_funcionario, Id_pagamento),

    FOREIGN KEY (Id_funcionario)
        REFERENCES Funcionario(Id_funcionario),

    FOREIGN KEY (Id_pagamento)
        REFERENCES Pagamentos(Id_pagamento)
);

CREATE TABLE CONSOME (
    Id_Estoque INT,
    Id_produto INT,

    PRIMARY KEY (Id_Estoque, Id_Produto),

    FOREIGN KEY (Id_Estoque)
        REFERENCES Estoque(Id_Estoque),

    FOREIGN KEY (Id_Produto)
        REFERENCES Produto(Id_Produto)
);

CREATE TABLE FORNECE (
    Id_Estoque INT,
    Id_produto INT,
    id_fonercedor INT,

    PRIMARY KEY (Id_Estoque, Id_produto, id_fonercedor),

    FOREIGN KEY (Id_Estoque)
        REFERENCES Estoque(Id_Estoque),

    FOREIGN KEY (Id_produto)
        REFERENCES Produto(Id_Produto),

    FOREIGN KEY (id_fonercedor)
        REFERENCES fornecedor(id_fonercedor)
);

CREATE TABLE ATENDE (
    Id_funcionario INT,
    Id_pedidos INT,

    PRIMARY KEY (Id_funcionario, Id_pedidos),

    FOREIGN KEY (Id_funcionario)
        REFERENCES Funcionario(Id_funcionario),

    FOREIGN KEY (Id_pedidos)
        REFERENCES Pedido(Id_pedidos)
);

CREATE TABLE CONTEM (
    Id_Produto INT,
    Id_pedidos INT,

    PRIMARY KEY (Id_Produto, Id_pedidos),

    FOREIGN KEY (Id_Produto)
        REFERENCES Produto(Id_Produto),

    FOREIGN KEY (Id_pedidos)
        REFERENCES Pedido(Id_pedidos)
);

CREATE TABLE POSSUI_PRODUTO (
    Id_Produto INT,
    Id_pagamento INT,

    PRIMARY KEY (Id_Produto, Id_pagamento),

    FOREIGN KEY (Id_Produto)
        REFERENCES Produto(Id_Produto),

    FOREIGN KEY (Id_pagamento)
        REFERENCES Pagamentos(Id_pagamento)
);

CREATE TABLE GERA (
    id_delivery INT,
    Id_pedidos INT,

    PRIMARY KEY (id_delivery, Id_pedidos),

    FOREIGN KEY (id_delivery)
        REFERENCES Delivery(id_delivery),

    FOREIGN KEY (Id_pedidos)
        REFERENCES Pedido(Id_pedidos)
);

CREATE TABLE ENTREGA (
    id_delivery INT,
    Id_funcionario INT,

    PRIMARY KEY (id_delivery, Id_funcionario),

    FOREIGN KEY (id_delivery)
        REFERENCES Delivery(id_delivery),

    FOREIGN KEY (Id_funcionario)
        REFERENCES Funcionario(Id_funcionario)
);

ALTER TABLE Pedido
ADD FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente);

ALTER TABLE programa_de_fidelidade
ADD FOREIGN KEY (id_cçiente)
REFERENCES Cliente(id_cliente);

ALTER TABLE Estoque
ADD FOREIGN KEY (Id_produto)
REFERENCES Produto(Id_Produto);