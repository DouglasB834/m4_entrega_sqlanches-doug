-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
	pedidos.*, produtos.* 
FROM  
	produtos 
JOIN 
	produtos_pedidos pp 
ON 
	pp.produto_id = produtos.id
JOIN 
	pedidos 
ON 
	pp.pedido_id  = pedidos.id;


-- 2)
SELECT DISTINCT  
	pp.pedido_id
FROM 
	pedidos p 
JOIN 
	produtos_pedidos AS pp 
ON 
	pp.produto_id =6 ;

-- 3)
SELECT DISTINCT  
	c.nome AS "gostam_de_fritas"
FROM 
	produtos_pedidos pp
JOIN	
	pedidos p ON p.id = pp.pedido_id 
JOIN 	
	clientes c ON c.id = p.cliente_id 
WHERE 
	pp.produto_id = 6;

-- 4)
SELECT
	ROUND(sum(p2.preco)::numeric,2) 
FROM  
	produtos_pedidos AS pp
JOIN 
	pedidos p ON p.id = pp.pedido_id
JOIN 
	clientes c ON c.id = p.cliente_id
JOIN 
	produtos p2 ON pp.produto_id = p2.id
WHERE
	c.nome = 'Laura'
;

-- 5)
SELECT 
	p.nome, count(*)
FROM 
	produtos_pedidos pp 
JOIN 
	produtos p ON p.id = pp.produto_id 
GROUP BY p.nome ORDER BY p.nome;