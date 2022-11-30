-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas
 SELECT * FROM clientes c ;
 SELECT * FROM produtos_pedidos ;
 SELECT * FROM pedidos ;
 SELECT * FROM endereços ;
 SELECT * FROM produtos ;

-- Tabela clientes
CREATE  TABLE IF NOT EXISTS clientes(
	id BIGSERIAL PRIMARY KEY,
	nome varchar(50)NOT NULL,
	lealdade integer NOT NULL
);

-- Tabela endereços
CREATE  TABLE IF NOT EXISTS endereços(
	id BIGSERIAL PRIMARY KEY,
	cep varchar(9)NOT NULL,
	rua varchar(50)NOT NULL,
	numero integer NOT NULL,
	bairro varchar(50)NOT NULL,
	complemento varchar(100),
	cliente_id integer,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabela pedidos
CREATE TABLE IF NOT EXISTS pedidos(
	id BIGSERIAL PRIMARY KEY,
	status varchar(50) NOT NULL,
	cliente_id integer NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE	 
);

-- Tabela produtos
CREATE  TABLE IF NOT EXISTS produtos(
	id BIGSERIAL PRIMARY KEY,
	nome varchar(100) UNIQUE NOT NULL,
	tipo varchar(30)NOT NULL,
	preço float(8)NOT NULL,
	pts_de_lealdade integer NOT NULL
);

-- Tabela produtos_pedidos
CREATE  TABLE IF NOT EXISTS produtos_pedidos(
	id BIGSERIAL PRIMARY KEY,
	pedido_id integer NOT NULL,
	produto_id integer NOT NULL,
	FOREIGN key (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
	FOREIGN key (produto_id) REFERENCES produtos(id) ON DELETE CASCADE	
);

