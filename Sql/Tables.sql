CREATE TABLE tbl_cliente(
    id_cliente INT AUTO_INCREMENT,
    documento VARCHAR(50),
    nome VARCHAR(100),
    fone VARCHAR(15),
    email VARCHAR(100),
    observacoes VARCHAR(100),
    endereco VARCHAR(100),
    PRIMARY KEY (id_cliente)

);

CREATE TABLE tbl_cliente_contato(
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nome VARCHAR(100),
    fone VARCHAR(15),
    email VARCHAR(100),
    observacoes VARCHAR(100),
    FOREIGN KEY fk_id_cliente(id_cliente)
    REFERENCES tbl_cliente(id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE tbl_pedido(
    id_pedido INT AUTO_INCREMENT,
    id_cliente INT,
    dtPediddo DATE,
    dtPrevisao_entrega INT,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY fk_id_cliente(id_cliente)
    REFERENCES tbl_cliente(id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE tbl_pedido_produto(
    id_pedido_produto INT AUTO_INCREMENT  PRIMARY KEY ,
    id_pedido INT,
    id_produto INT,
    preco_unitario FLOAT (10,3),
    quantidade INT,
    FOREIGN KEY fk_id_pedido(id_pedido)
    REFERENCES tbl_pedido(id_pedido)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY fk_id_produto(id_produto)
    REFERENCES tbl_produto(id_produto)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
 
);


CREATE TABLE tbl_produto(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    referencia VARCHAR(100),
    preco FLOAT(10,3)
);