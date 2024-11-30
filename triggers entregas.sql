delimiter //
create trigger log_opcoes_entrega_insert
after insert on  opcoes_entrega
for each row
begin
insert into Log ( nome_tabela, operacao,  valor_novo) values 
        ('opcoes_entrega', 'insert',  new.id_entrega),
        ('opcoes_entrega', 'insert',  new.tipo_entrega),
        ('opcoes_entrega', 'insert',  new.preco);
        
end;
//
delimiter ;




delimiter //
create trigger log_opcoes_entrega_update
after update on  opcoes_entrega
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual, valor_novo) values 
        ('opcoes_entrega', 'update', old.id_entrega, new.id_entrega),
        ('opcoes_entrega', 'update', old.tipo_entrega, new.tipo_entrega),
        ('opcoes_entrega', 'update', old.preco, new.preco);
end;
//
delimiter ;




delimiter //
create trigger log_opcoes_entrega_delete
after delete on  opcoes_entrega
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual) values 
		('opcoes_entrega', 'delete',  old.id_entrega),
        ('opcoes_entrega', 'delete',  old.tipo_entrega),
        ('opcoes_entrega', 'delete',  old.preco);
end;
//
delimiter ;

