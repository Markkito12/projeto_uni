delimiter //
create trigger log_metodos_pagamento_insert
after insert on  metodos_pagamento
for each row
begin
insert into Log ( nome_tabela, operacao,  valor_novo) values 
        ('metodos_pagamento', 'insert',  new.id_pagamento),
        ('metodos_pagamento', 'insert',  new.tipo_pagamento),
        ('metodos_pagamento', 'insert',  new.preco),
        ('metodos_pagamento', 'insert',  new.id_cartao);
        
        
end;
//
delimiter ;




delimiter //
create trigger log_metodos_pagamento_update
after update on  metodos_pagamento
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual, valor_novo) values 
        ('metodos_pagamento', 'update', old.id_pagamento, new.id_pagamento),
        ('metodos_pagamento', 'update', old.tipo_pagamento, new.tipo_pagamento),
        ('metodos_pagamento', 'update', old.preco, new.preco),
		('metodos_pagamento', 'update', old.id_cartao, new.id_cartao);
end;
//
delimiter ;




delimiter //
create trigger log_metodos_pagamento_delete
after delete on  metodos_pagamento
for each row
begin
insert into Log ( nome_tabela, operacao,valor_atual) values 
		('metodos_pagamento', 'delete',  old.id_pagamento),
        ('metodos_pagamento', 'delete',  old.tipo_pagamento),
        ('metodos_pagamento', 'delete',  old.preco),
		('metodos_pagamento', 'delete',  old.id_cartao);
        
end;
//
delimiter ;


