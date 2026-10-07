-- Active: 1788351678633@@127.0.0.1@3306@smartcoffee_dml_joao
INSERT INTO  cliente (nome,email,telefone,cidade,ativo) VALUES
('Edson wladimir', 'edison@email.com','199999999988244', 'paris', TRUE);

--- Exemplo de estrutura simples de SELECT
-- SELECT  coluna
-- FROM tabela;

-- EX 1: SELECT PARA CONSULTAR TODAS AS COLUNAS
SELECT * FROM cliente;

-- EX 2: CONSULTANDO  POR COLUNAS
SELECT nome, email FROM cliente;

--  EX 3: INSERINO APELIDO NAS COLUNAS -- ALIAS
SELECT nome AS cliente
FROM cliente;

SELECT nome AS cliente, telefone AS contatos, ativo AS STATUS
FROM  cliente;

SELECT nome, preco, preco * 090 AS preço_pROMOCINAL
FROM produto;

--  EX 4: DISTINCT - ELIMINAR  REPETIÇÕES
SELECT cidade FROM cliente;

SELECT DISTINCT cidade
FROM cliente;
-- SEM DISTINCT O ITEM IRÁ APARECER VÁRIAS VEZEZ
-- COM DISTINCT O ITEM IRÁ APARECER UM VEZ

-- EX 5: FILTRO EM REGISTRO
SELECT nome, preco
FROM produto
WHERE preco > 10;
-- RETORNA VALORES ACIMA DE 10 REAIS EM SEUS PREÇOS


SELECT nome, preco
FROM cliente
WHERE ativo = TRUE;
--RETORNA PRODUTOS ATIVOS

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00
-- RETORNA PEDIDOS ACIMA DE DETERMINADO VALOR


-- OPERADORES DE COMPARAÇÃO
-- = IGUAL
-- <> OU != DFERENTE
-- > MAIOR QUE
-- >= MAIOR OU IGUAL
-- < MRNOR QUE
-- <= MENOR OU IGUAL

--  EX 6: USO DE AND, OR R NOT
-- AND - TODAS AS CONDIÇÕES PRECISAM SER VERDADEIRAS
SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 20.00;

--  OR - PELO MENOS UMA CONDIÇÃO VERDADERA
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' or cidade = 'piracicaba';

-- NOT - NEGAR NÃO TRAZER RESULTADO QUE FOI APRESENTADO
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeia';

-- JUNTOS - AND E OR
SELECT nome, cidade, ativo AS STATUS
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Americana');

-- EX 7: PESQUISANDO POR INTERVALOS - BETWEEN
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-1 00:00:00' AND '2026-09-30 23:59:59';

-- EX 8: IN COM VARIAS POSSIBILIDADES
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira','America','Piracicaba');

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Campinas');

-- EX 9: EXEMPLO COM TEXTOS OU PESQUISAR POR TEXTO - LIKE
-- CORINGAS
-- % VÁRIOS CARACTERES
-- _ EXATAMENTW UM CARACTER

SELECT nome 
FROM produto
WHERE nome LIKE '%chocolate';
-- RETORNAR PRODUTOD QUE POSSUEM A PALAVRA CHOCOLATE

SELECT nome 
FROM produto
WHERE nome LIKE '%silva';
-- RETORNA NOMES QUE TERMINAM COM SILVA

SELECT nome 
FROM produto
WHERE nome LIKE '_afé%';


-- EX 10: NULL - AUSÊNCIA DE VALOR
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

--  EX 11: ORDER BY - ORDENAR RESULTADOS
-- ASC SIGNIFICA CRESCENTE
-- DESC SIGNFICA DECRESCENTE
SELECT nome, preco
FROM produto
ORDER BY preco ASC;

SELECT nome, preco
FROM produto
order by preco DESC;

SELECT cidade, nome
FROM cliente
ORDER BY cidade ASC, nome DESC;



-- EX 12: LIMIT - LIMITANDO A QUANTIDADE DE LINHA
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;

SELECT nome, preco
FROM produto
ORDER BY nome
LIMIT 5 OFFSET 5;


-- EX 13: CÁLCULO DE COLUNAS
SELECT nome, preco, preco * 1.10 AS preco_atualizado
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS total_Compra
FROM item_pedido;


-- EX 14: FUNÇÕES PARA CONSULTA
SELECT UPPER(nome) AS Nome_Cliente, LOWER(email) AS Email_Minusculo
FROM cliente;

SELECT CONCAT(nome, '-', cidade) AS Clinte_cidade
FROM cliente;

-- NÚMEROS
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preços_desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido, DATE(data_pedido) AS DATAS, MONTH(data_pedido) AS MÊs, YEAR(data_pedido) AS ANO
FROM pedido;

-- SUBSTITUINDO O NULL NO REULTDO
SELECT  nome, COALESCE(telefone, 'Não informado') AS Contato
FROM cliente;



-- EX 15: FUNÇÕES DE AGREGAÇÃO - SUM, AVG, MIN, MAX, COUNT
-- COUNT - CONTAR QUANTIDADE DE REGISTROS
-- SUM - SOMAS DE VALORES
-- AVG - MÉDIA DE VALORES
-- MIN MENOR VALOR
-- MAX - MAIOR VALOR

SELECT COUNT(*) AS TOtal_Cliente
FROM cliente;
-- RESULTADO DE QUANTIDADE DE CLIENTES

SELECT AVG(preco) AS Média_Preços
FROM produto;
-- MÉDIA DO VALOR DOS PRODUTOS

SELECT MIN(preco) AS PROMOÇÃO, MAX(preco) AS REAJUSTE, AVG(preco) AS MÉDIA_PREÇOS
FROM produto;
-- RESUMO DE PREÇOS

SELECT SUM(valor_total) AS FATURAMENTO_MENSAL
FROM pedido
WHERE status = 'ABERTO'
-- TOTAL DE PEDIDOS FINALIZADOS


-- EX 16: GRUPO BY - AGRUPAR  DADOS
SELECT CIDADE, COUNT(*) AS QTDE_CIDADES
FROM cliente
GROUP BY cidade;
--  CONSULTA POR GRUOPOS DE CIDADES

SELECT id_categoria, COUNT(*) AS QTDE_PRODUTOS
FROM produto
GROUP BY id_categoria;
-- QUANTIDADE DE PRODUTOS POR CATEGORIA


--  EX 17: HAVING - FILTRO POR GRUPOS
SELECT cidade, COUNT(*) AS QUANTIDADES_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;
-- DICA: USAR O HAVING E NÃO ESQUECER O GRUOP BY


----------------------------------------------------------------------------------------------
-- EX 18: CONSULTA COMPLETA
SELECT COLUNAS
FROM TABELAS
WHERE CONDICAO
GROUP BY COLUNAS_AGRUPAR
HAVING CONDICAO
ORDER BY COLUNAS
LIMIT QUANTIDADE;
---------------------------------------------------------------------------------------------

