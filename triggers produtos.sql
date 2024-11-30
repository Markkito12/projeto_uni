
delimiter //
create trigger log_produtos_insert
after insert on  produtos
for each row
begin
insert into Log ( nome_tabela, operacao,  valor_novo) values 
		('produtos', 'insert',  new.id_produto),
        ('produtos', 'insert',  new.nome),
        ('produtos', 'insert',  new.preco),
        ('produtos', 'insert',  new.imagem),
        ('produtos', 'insert',  new.quantidade);
        
end;
//
delimiter ;



delimiter //
create trigger log_produtos_update
after update on  produtos
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual, valor_novo) values 
        ('produtos', 'update', old.id_produto, new.id_produto),
        ('produtos', 'update', old.nome, new.nome),
        ('produtos', 'update', old.preco, new.preco),
        ('produtos', 'update', old.imagem, new.imagem),
        ('produtos', 'update', old.quantidade, new.quantidade);
end;
//
delimiter ;

delimiter //
create trigger log_produtos_delete
after delete on  produtos
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual) values 
        ('produtos', 'delete',  old.id_produto),
		('produtos', 'delete',  old.nome),
        ('produtos', 'delete',  old.preco),
        ('produtos', 'delete',  old.imagem),
        ('produtos', 'delete',  old.quantidade);
end;
//
delimiter ;

