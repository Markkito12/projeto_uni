delimiter //
create trigger log_pedidos_insert
after insert on  pedidos
for each row
begin
insert into Log ( nome_tabela, operacao,  valor_novo) values 
        ('pedidos', 'insert',  new.id_pedido),
        ('pedidos', 'insert',  new.cpf),
        ('pedidos', 'insert',  new.id_produto),
        ('pedidos', 'insert',  new.id_entrega),
        ('pedidos', 'insert',  new.id_pagamento),
        ('pedidos', 'insert',  new.quantidade),
        ('pedidos', 'insert',  new.total),
        ('pedidos', 'insert',  new.data_pedido);
end;
//
delimiter ;

select * from produtos

delimiter //
create trigger log_pedidos_update
after update on  pedidos
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual, valor_novo) values 
        ('pedidos', 'update', old.id_pedido, new.id_pedido),
        ('pedidos', 'update', old.cpf, new.cpf),
        ('pedidos', 'update', old.id_produto, new.id_produto),
        ('pedidos', 'update', old.id_entrega, new.id_entrega),
        ('pedidos', 'update', old.id_pagamento, new.id_pagamento),
        ('pedidos', 'update', old.quantidade, new.quantidade),
        ('pedidos', 'update', old.total, new.total),
        ('pedidos', 'update', old.data_pedido, new.data_pedido);
end;
//
delimiter ;

delimiter //
create trigger log_pedidos_delete
after delete on  pedidos
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual) values 
        ('pedidos', 'delete',  old.id_pedido),
        ('pedidos', 'delete',  old.cpf),
        ('pedidos', 'delete',  old.id_produto),
        ('pedidos', 'delete',  old.id_entrega),
        ('pedidos', 'delete',  old.id_pagamento),
        ('pedidos', 'delete',  old.quantidade),
        ('pedidos', 'delete',  old.total),
        ('pedidos', 'delete',  old.data_pedido);
end;
//
delimiter ;


