-- Active: 1788351678633@@127.0.0.1@3306@smartcoffee_dml_joao
use SMARTCOFFEE_DML_JOAO;

--- INSERINO DADOS NO BD
-- DML: INSERTS, UPDATE, DELETE

INSERT INTO cliente (NOME,EMAIL,TELEFONE,CIDADE,ATIVO) VALUES
('Adryan Costa', 'adryan@email.com', '199999901', 'Limeiro',TRUE),
('Ana Francisca', 'ana@email.com', '199999902', 'Lençois Paulista',TRUE),
('Ana Julia', 'ana@email.com', '199999903', 'Limeiro',TRUE),
('Beatriz Barros', 'beatriz@email.com', '199999904', 'Limeiro',TRUE),
('Beatriz Santana', 'beatriz@email.com', '199999905', 'Limeiro',TRUE),
('Bruno Dias', 'bruno@email.com', '199999906', 'Limeiro',TRUE),
('Cristopher da Costa', 'cristopher@email.com', '199999907', 'Moi Guaçu',TRUE),
('Davi Guerra', 'davi@email.com', NULL, 'Limeira',TRUE),
('Gabriel Lucio', 'gabriel@email.com', '199999909', 'Limeira',TRUE),
('Gabriela Lima', 'gabriela@email.com', '199999910', 'Curitiba',TRUE),
('Giovana Santana', 'giovana@email.com', NULL, 'Juqueropólis',TRUE),
('Gustavo Couto', 'Gustavo@email.com', '199999912', 'Ipatinga',TRUE),
('Isabeli Sousa', 'isabele@email.com', NULL, 'Limeira',TRUE),
('Jacó de Souza', 'jaco@email.com', '199999914', 'LImeira',TRUE),
('João Moreira', 'joao@email.com', '199999915', 'Limeira',TRUE),
('Jonh Pierre', 'john@email.com', '199999916', 'cap haitien',TRUE),
('Jonas Dawid', 'jonas@email.com', '199999917', 'rio de janeiro',TRUE),
('Juan Pablo', 'juan@email.com', '199999918', 'LImeira',TRUE),
('Julia Fernanda', 'Julia@email.com', '199999919', 'Limeira',TRUE);

--INSERINDO CAMPOS COM CHAVE ESTRANGEIRA
INSERT INTO produto (NOME,PRECO,ATIVO,ID_CATEGORIA) VALUES
('MANTEIGA GIOVANA', 14.00, TRUE,5)

INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',14.00,25)

set @pedido = LAST_INSERT_ID();
SELECT @pedido;



--------------------------------------------------------------------------------------------




--ATUALIZANDO OU MODIFICANDO DADOS NO BD
--EX1: ATUALIZANDO INFORMAÇÕES INDIVIDUAL
UPDATE cliente
SET TELEFONE = '1999988801'
WHERE id_cliente = 20;


UPDATE cliente
SET ativo = TRUE
WHERE id_cliente = 3;

--NUNCA, JAMAIS, NEVER ESQUEÇAM DE UTILIZAR O WHERE 😎

--PRIMEIRA ETAPA
SELECT * FROM cliente
WHERE id_cliente = 3;

--SEGUNDA ETAPA
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 3;

--EX2 ATUALIZANDO MAIS DO QUE UM CAMPO
UPDATE cliente
SET telefone = '19999888016',
cidade = 'Campinas'
    WHERE id_cliente = 3;

--EX3: ATUALIZANDO COM CONDICIONAIS
UPDATE produto
SET preco = preco * 1.50
WHERE id_categoria = 1;

--APAGANDO DADOS
--EX1: APAGAR DADOS SEM CONTER INFORMAÇÕES
DELETE FROM cliente;

-- EX2: APAGAR DADOS COM CONDIÇÕES
DELETE FROM cliente
WHERE id_cliente = 29;

-- EX3: APAGANDO DADOS DE TODA TABELA
TRUNCATE TABLE cliente;

--EX4: APAGAR DE FORMA REPRESENTATIVA OU LÓGICA
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 17;

----------------------------------------------------------------------

-- REALIZANDO PASSOS PARA UMA COMPRA NO SMARTCOFFEE
-- PASSO 1: CADASTRAR UM NOVO CLIENTE
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Bruno A', 'brunoa@email.com', '1999123456', 'Piracicaba', TRUE);

SET @cliente = LAST_INSERT_ID();

-- PASSO 2: CRIAR O PDEDIDO
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',0.00,20);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: INSERIR ITENS NO PEDIDO
INSERT INTO item_pedido 
(ID_PEDIDO, id_produto, quantidade, preco_unitario) VALUES
(@pedido, 4, 1, 73.13),
(@pedido, 11, 1, 11.25);

-- PASSO 4: ATUALIZAR O TOTAL E STATUS
UPDATE pedido
SET valor_total =84.38,
   status = 'preparando'
   WHERE id_pedido = @pedido;

--PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 1, 84.38, NOW());


-- CONSULTAR DADOS EM TABELAS BD
--CONSULTAR TODA A TABELA
SELECT * FROM pagamento;
SELECT * FROM cliente
WHERE id_cliente = 20;
