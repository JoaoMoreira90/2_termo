-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: joao victor moreira
-- Turma: 2-DEVIE Data: 30/09/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_beatriz;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - AQUECIMENTO
-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT NOME,CIDADE,EMAIL 
FROM CLIENTE;


-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT CIDADE AS CIDADE_SEM_REPETICAO
FROM CLIENTE;


-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME, PRECO
FROM PRODUTO 
ORDER BY PRECO ASC;


-- 5. Mostre apenas os 5 produtos mais caros.
SELECT NOME,PRECO
FROM produto
ORDER BY PRECO DESC
LIMIT 5;
-- PARTE B - FILTROS


-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.



-- 7. Liste os clientes das cidades Limeira ou Americana.


-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT NOME 
FROM produto
WHERE NOME LIKE 'CAFE%';


-- 9. Liste os clientes que não informaram telefone.
SELECT NOME,TELEFONE
FROM cliente
WHERE TELEFONE IS NULL;



-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT NOME,PRECO
FROM produto
ORDER BY PRECO DESC;
-- PARTE C - CÁLCULOS E AGRUPAMENTOS



-- 11. Informe quantos produtos estão cadastrados.



-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(PRECO) AS PROMOCAO, MAX (PRECO) AS REAJUSTE,AVG (PRECO) AS MEDAI_PRECOS
FROM PRODUTO;



-- 13. Informe quantos clientes existem em cada cidade.
SELECT CIDADE,COUNT(*) AS QTDE_CIDADE
FROM cliente
GROUP BY CIDADE;



-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT CIDADE, COUNT(*) AS QUANTIDADE_CLIENTES
FROM CLIENTE
GROUP BY CIDADE
HAVING COUNT (*) >= 2;


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT * from pedido;
-- PARTE D - RELACIONAMENTOS


-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM cliente AS 
LEFT JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENETE
ORDER BY C.NOME;


-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT CA.NOME AS CATEGORIA, COUNT(PR.ID_PRODUTO) AS QTDE_PRODUTOS
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME
ORDER BY QTDE_PRODUTOS DESC;
-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.


-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;
-- PARTE E - DESAFIO GERENCIAL


-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:

--
-- Por que essa informação é útil?
--