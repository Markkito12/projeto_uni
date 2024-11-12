CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    imagem VARCHAR(255),
    quantidade INT NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT  ,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(30),
    estado VARCHAR(50),
    cep CHAR(9)
);

CREATE TABLE cartoes (
    id_cartao INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    numero_cartao DECIMAL(18,0) NOT NULL,  
    nome_no_cartao VARCHAR(50) NOT NULL,
    validade DATE NOT NULL,
    codigo_seguranca INT NOT NULL,  
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


CREATE TABLE opcoes_entrega (
    id_entrega INT PRIMARY KEY AUTO_INCREMENT,
    tipo_entrega VARCHAR(10) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Metodos_pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_pagamento VARCHAR(30) NOT NULL,  
    id_cartao INT,  
    FOREIGN KEY (id_cartao) REFERENCES Cartoes(id_cartao)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    id_entrega INT NOT NULL,
    id_pagamento INT NOT NULL,
    quantidade INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_entrega) REFERENCES opcoes_entrega(id_entrega),
    FOREIGN KEY (id_pagamento) REFERENCES metodos_pagamento(id_pagamento)
);



insert into produtos (nome, preco, imagem, quantidade)values
('cadeira', 22, 'uuwgcwl.com',2);

insert into clientes (nome,endereco,cidade,estado,cep) values 
('Artr', 'Barra fuda' , 'São Paulo', 'São Paulo', '99999999');

insert into Cartoes (id_cliente, numero_cartao, nome_no_cartao, validade, codigo_seguranca) values
(1,1111222233334444,'Andtr','01-09-25',555);

insert into opcoes_entrega (tipo_entrega,preco) values 
('sedex',28.00);

insert into metodos_pagamento (tipo_pagamento,id_cartao) values 
('credito',1);

insert into pedidos (id_cliente,id_produto,id_entrega,id_pagamento,quantidade,total,data_pedido) values 
(1,1,1,1,10,50.00,'01-12-24');
