

/*Recuperar os ID’s dos pedidos que o cliente 14 fez 
no período que compõe o mês de setembro do ano de
 2010.*/

select id_pedido from tbl_pedido
where tbl_pedido.id_cliente = 14 and MONTH(tbl_pedido.dtPediddo) = '9' and YEAR(tbl_pedido.dtPediddo)= '2010';


/*Recuperar o número de pedidos que o cliente 14 fez
 em cada mês do ano de 2010. Ordenar o resultado por
  mês.*/
select id_pedido from tbl_pedido
where tbl_pedido.id_cliente = 14  and YEAR(tbl_pedido.dtPediddo)= '2010'
order by tbl_pedido.dtPediddo;

/*Atualizar o registro do cliente 14, para que o campo 
"observacoes" tenha a frase "Cliente VIP" concatenada 
ao final do conteúdo atual.*/
INSERT INTO tbl_cliente_contato (`id_cliente`,`nome`,`fone`,`email`,`observacoes`) VALUES (14,'Rafael Almeida da Silva','965049120','Rafael.silva.pessoal@gmail.com','Teste de inserção');
UPDATE tbl_cliente_contato SET observacoes = 'Cliente VIP' WHERE id_cliente = 14;
UPDATE tbl_cliente SET observacoes = 'Cliente VIP' WHERE id_cliente = 14;

/*Recuperar todos os pedidos do cliente 14, retornando
 as seguintes colunas: ID do Cliente, Nome do Cliente,
 ID do Pedido, ID do Produto, Nome do Produto e Preço 
 de tabela do produto.*/

SELECT cliente.id_cliente,
            cliente.nome,
            pedido.id_pedido,
            carrinho.id_produto,
            produto.nome,
            produto.preco
    
     FROM tbl_cliente_contato as cliente
             INNER JOIN
              tbl_pedido as pedido ON cliente.id_cliente = pedido.id_cliente
             INNER JOIN
              tbl_pedido_produto as carrinho ON (pedido.id_pedido = carrinho.id_pedido)
             INNER JOIN
              tbl_produto as produto ON (carrinho.id_pedido = produto.id_produto)
    
    
WHERE 
    cliente.id_cliente = 14;

/*  OU  */

 SELECT cliente.id_cliente,
            cliente.nome,
            pedido.id_pedido,
            carrinho.id_produto,
            produto.nome,
            produto.preco
 From  tbl_cliente_contato cliente, 
       tbl_pedido pedido,
       tbl_pedido_produto carrinho,
       tbl_produto produto 
 
 where cliente.id_cliente = 14 and  
      cliente.id_cliente = pedido.id_cliente  and 
      pedido.id_pedido = carrinho.id_pedido and 
      carrinho.id_pedido = produto.id_produto
;

/*Incluir um novo pedido, na data atual e para o 
cliente 14 (com qualquer previsão de entrega). 
Para esse pedido, incluir dois produtos (com id, 
preço e quantidade que desejar).*/


CREATE PROCEDURE AddDoisProdutos (OUT param1 INT)
BEGIN
   declare idProduto1 int;
   declare idProduto2 int;
   declare idPedido int;

   INSERT INTO tbl_produto (`nome`,`referencia`,`preco`) 
   VALUES ('Jaqueta','Lacost',220.0);
   idProduto1 = LAST_INSERT_ID();

   INSERT INTO tbl_produto (`nome`,`referencia`,`preco`) 
   VALUES ('Jaqueta','Oakley',270.0);
   idProduto2 = LAST_INSERT_ID();
   
   INSERT INTO tbl_pedido (`id_cliente`,`dtPediddo`,`dtPrevisao_entrega`) 
   VALUES (14,NOW(),7);
   idPedido = LAST_INSERT_ID();

   INSERT INTO tbl_pedido_produto (`id_pedido`,`id_produto`,`preco_unitario`,`quantidade`) VALUES (LAST_INSERT_ID(),1,220.0,1);
   INSERT INTO tbl_pedido_produto (`id_pedido`,`id_produto`,`preco_unitario`,`quantidade`) VALUES (LAST_INSERT_ID(),1,270.0,1);
END

INSERT INTO tbl_produto (`nome`,`referencia`,`preco`) 
VALUES ('Jaqueta','Lacost',220.0);
INSERT INTO tbl_produto (`nome`,`referencia`,`preco`) 
VALUES ('Jaqueta','Oakley',270.0);

INSERT INTO tbl_pedido (`id_cliente`,`dtPediddo`,`dtPrevisao_entrega`) 
VALUES (14,NOW(),7);



SELECT cliente.nome, cliente.documento
FROM tbl_cliente as cliente,
     tbl_cliente_contato as contato

WHERE
    cliente.id_cliente = contato.id_cliente and
    contato.nome <> '' and
    contato.fone <> '' and
    contato.email <> '';



/**/
TRUNCATE TABLE tbl_pedido;
TRUNCATE TABLE tbl_pedido_produto;
TRUNCATE TABLE tbl_produto;
TRUNCATE TABLE tbl_cliente_contato;
TRUNCATE TABLE tbl_cliente;