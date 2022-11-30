-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO 
clientes(nome, lealdade)
VALUES
('Georgia', 0)
;


-- 2)
INSERT INTO 
	pedidos (status, cliente_id)
VALUES('Recebido', 6)
;

-- 3)
INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
VALUES
(6,1),
(6,2),
(6,6)
;


-- Leitura

-- 1)
SELECT DISTINCT c.*, p.*, p2.* FROM 
	produtos_pedidos pp 
JOIN pedidos p ON pp.pedido_id = p.id 
JOIN produtos p2 ON pp.produto_id = p2.id 
JOIN clientes c ON c.id = p.cliente_id WHERE c.id=6
;



-- Atualização

-- 1)
UPDATE clientes
SET lealdade = 
(SELECT  sum(p2.pts_de_lealdade)  FROM 
	produtos_pedidos pp 
JOIN pedidos p ON pp.pedido_id = p.id 
JOIN produtos p2 ON pp.produto_id = p2.id 
JOIN clientes c ON c.id = p.cliente_id WHERE c.nome = 'Georgia' )
WHERE clientes.nome=  'Georgia' ;


-- Deleção

-- 1)
UPDATE clientes 
SET lealdade =36 
WHERE clientes.id = 5
RETURNING *;



