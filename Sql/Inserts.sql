/*Clientes*/
INSERT INTO tbl_cliente (`documento`,`endereco`) VALUES ('385125446','Rua Suiça, 54, Jd.Sao Jose, Suzano, SP'); 
/*Contatos*/
INSERT INTO tbl_cliente_contato (`id_cliente`,`nome`,`fone`,`email`,`observacoes`) VALUES (14,'Rafael Almeida da Silva','965049120','Rafael.silva.pessoal@gmail.com','Teste de inserção'); 
/*Produto*/
INSERT INTO tbl_produto (`nome`,`referencia`,`preco`) VALUES ('Camisa polo','Lacost',120.0);
/*Pedido*/
INSERT INTO tbl_pedido (`id_cliente`,`dtPediddo`,`dtPrevisao_entrega`) VALUES (14,'2010-9-04',7);
/*Carrinho*/
INSERT INTO tbl_pedido_produto (`id_pedido`,`id_produto`,`preco_unitario`,`quantidade`) VALUES (1,1,120.0,1);