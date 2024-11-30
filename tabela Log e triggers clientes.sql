create table log (
id  int not null primary key auto_increment,
nome_tabela  varchar(50)  not null,
operacao  varchar(10) not null check(operacao IN ('insert', 'update', 'delete')), 
valor_atual  varchar (50) null,
valor_novo  varchar(50) null
) ;


delimiter //
create trigger log_clientes_insert
after insert on  clientes
for each row
begin
insert into Log ( nome_tabela, operacao,  valor_novo) values 
        ('clientes', 'insert',  new.cpf),
        ('clientes', 'insert',  new.nome),
        ('clientes', 'insert',  new.endereco),
        ('clientes', 'insert',  new.cidade),
        ('clientes', 'insert',  new.estado),
        ('clientes', 'insert',  new.cep);
end;
//
delimiter ;



delimiter //
create trigger log_clientes_update
after update on  clientes
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual, valor_novo) values 
        ('clientes', 'update', old.cpf, new.cpf),
        ('clientes', 'update', old.nome, new.nome),
        ('clientes', 'update', old.endereco, new.endereco),
        ('clientes', 'update', old.cidade, new.cidade),
        ('clientes', 'update', old.estado, new.estado),
        ('clientes', 'update', old.cep, new.cep);
end;
//
delimiter ;

delimiter //
create trigger log_clientes_delete
after delete on  clientes
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual) values 
        ('clientes', 'delete', old.cpf),
        ('clientes', 'delete', old.nome),
        ('clientes', 'delete', old.endereco),
        ('clientes', 'delete', old.cidade),
        ('clientes', 'delete', old.estado),
        ('clientes', 'delete', old.cep);
end;
//
delimiter ;

