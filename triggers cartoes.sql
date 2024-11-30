
delimiter //
create trigger log_cartoes_insert
after insert on  cartoes
for each row
begin
insert into Log ( nome_tabela, operacao,  valor_novo) values 
        ('cartoes', 'insert',  new.id_cartao),
        ('cartoes', 'insert',  new.numero_cartao),
        ('cartoes', 'insert',  new.nome_no_cartao),
        ('cartoes', 'insert',  new.validade),
        ('cartoes', 'insert',  new.codigo_seguranca);
        
end;
//
delimiter ;



delimiter //
create trigger log_cartoes_update
after update on  cartoes
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual, valor_novo) values 
        ('cartoes', 'update', old.id_cartao, new.id_cartao),
        ('cartoes', 'update', old.numero_cartao, new.numero_cartao),
        ('cartoes', 'update', old.nome_no_cartao, new.nome_no_cartao),
        ('cartoes', 'update', old.validade, new.validade),
		('cartoes', 'update', old.codigo_seguranca, new.codigo_seguranca);
end;
//
delimiter ;

delimiter //
create trigger log_cartoes_delete
after delete on  cartoes
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual) values 
		('cartoes', 'delete',  old.id_cartao),
        ('cartoes', 'delete',  old.numero_cartao),
        ('cartoes', 'delete',  old.nome_no_cartao),
        ('cartoes', 'delete',  old.validade),
        ('cartoes', 'delete',  old.codigo_seguranca);
end;
//
delimiter ;

