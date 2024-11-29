create table produtos (
    id_produto int primary key auto_increment,
    nome varchar(30) not null,
    preco decimal(10, 2) not null,
    imagem varchar(255),
    quantidade int not null
);

create table clientes (
    cpf char(11) primary key,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    cidade varchar(30),
    estado varchar(50),
    cep char(9)
);

create table cartoes (
    id_cartao int primary key auto_increment,
    cpf char(11) not null,
    numero_cartao decimal(18,0) not null,  
    nome_no_cartao varchar(50) not null,
    validade date not null,
    codigo_seguranca int not null,  
    foreign key (cpf) references clientes(cpf)
);


create table opcoes_entrega (
    id_entrega int primary key auto_increment,
    tipo_entrega varchar(10) not null,
    preco decimal(10, 2) not null
);

create table metodos_pagamento (
    id_pagamento int primary key auto_increment,
    tipo_pagamento varchar(30) not null,
    preco,
    id_cartao int,  
    foreign key (id_cartao) references cartoes(id_cartao)
);

create table pedidos (
    id_pedido int primary key auto_increment,
    cpf char(11) not null,
    id_produto int not null,
    id_entrega int not null,
    id_pagamento int not null,
    quantidade int not null,
    total decimal(10, 2) not null,
    data_pedido date not null,
    foreign key (cpf) references clientes(cpf),
    foreign key (id_produto) references produtos(id_produto),
    foreign key (id_entrega) references opcoes_entrega(id_entrega),
    foreign key (id_pagamento) references metodos_pagamento(id_pagamento)
);



insert into produtos (nome, preco, imagem, quantidade)values
('cadeira', 22, 'uuwgcwl.com',2);

insert into clientes (cpf, nome ,endereco ,cidade ,estado ,cep) values 
(44454587008,'Aobmr', 'Barra tuda' , 'São Paulo', 'São Paulo', '99999999');

insert into cartoes (cpf, numero_cartao, nome_no_cartao, validade, codigo_seguranca) values
(44455566688,1111222233334444,'Andtr','01-09-25',555);

insert into opcoes_entrega (tipo_entrega,preco) values 
('sedex',28.00);

insert into metodos_pagamento (tipo_pagamento,id_cartao) values 
('credito',1);

insert into pedidos (cpf,id_produto,id_entrega,id_pagamento,quantidade,total,data_pedido) values 
(44455566688,1,1,1,10,50.00,'01-12-24');
